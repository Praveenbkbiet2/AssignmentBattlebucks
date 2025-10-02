//
//  PostsService.swift
//  AssignmentBattlebucks
//
//  Created by Praveen Verma on 10/2/25.
//

import Foundation

protocol PostsServiceProtocol {
    func fetchPosts() async throws -> [Post]
}

final class PostsService: PostsServiceProtocol {
    static let shared = PostsService()
    private init() {}

    func fetchPosts() async throws -> [Post] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let jsonString = String(data: data, encoding: .utf8) {
                print("✅ Raw JSON Response:\n\(jsonString)")
            }
        

        guard let http = response as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
            throw NetworkError.requestFailed
        }

        do {
            return try JSONDecoder().decode([Post].self, from: data)
            
        } catch {
            throw NetworkError.decodingError
        }
    }
}
