//
//  PostsViewModel.swift
//  AssignmentBattlebucks
//
//  Created by Praveen Verma on 10/2/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class PostsViewModel: ObservableObject {
    @Published private(set) var posts: [Post] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let service: PostsServiceProtocol

    @Published private(set) var favorites: Set<Int> = [] {
        didSet { saveFavorites() }
    }

    private let favoritesKey = "favorite_post_ids"

    init(service: PostsServiceProtocol = PostsService.shared) {
        self.service = service
        loadFavorites()
    }

    var filteredPosts: [Post] {
        guard !searchText.trimmingCharacters(in: .whitespaces).isEmpty else { return posts }
        return posts.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }

    func fetchPosts() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetched = try await service.fetchPosts()
            posts = fetched.sorted { $0.id < $1.id }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func toggleFavorite(_ post: Post) {
        if favorites.contains(post.id) {
            favorites.remove(post.id)
        } else {
            favorites.insert(post.id)
        }
    }

    func isFavorite(_ post: Post) -> Bool {
        favorites.contains(post.id)
    }

    private func loadFavorites() {
        if let data = UserDefaults.standard.array(forKey: favoritesKey) as? [Int] {
            favorites = Set(data)
        }
    }

    private func saveFavorites() {
        UserDefaults.standard.set(Array(favorites), forKey: favoritesKey)
    }
}
