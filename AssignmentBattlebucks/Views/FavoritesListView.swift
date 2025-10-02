//
//  FavoritesListView.swift
//  AssignmentBattlebucks
//
//  Created by Praveen Verma on 10/2/25.
//

import SwiftUI

struct FavoritesListView: View {
    @EnvironmentObject var vm: PostsViewModel

    var favoritePosts: [Post] {
        vm.posts.filter { vm.favorites.contains($0.id) }
    }

    var body: some View {
        if favoritePosts.isEmpty {
            VStack {
                Text("No favorites yet")
                    .font(.headline)
                Text("Mark posts with the heart icon to see them here.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding()
        } else {
            List(favoritePosts) { post in
                NavigationLink {
                    PostDetailView(post: post)
                } label: {
                    PostRow(post: post)
                }
            }
            
        }
    }
}
