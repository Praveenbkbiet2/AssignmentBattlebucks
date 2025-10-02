//
//  PostDetailView.swift
//  AssignmentBattlebucks
//
//  Created by Praveen Verma on 10/2/25.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    @EnvironmentObject var vm: PostsViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(post.title)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        vm.toggleFavorite(post)
                    } label: {
                        Image(systemName: vm.isFavorite(post) ? "heart.fill" : "heart")
                            .resizable()
                            .foregroundColor(vm.isFavorite(post) ? .red : .primary)
                            .frame(width: 22)
                            .frame(height: 20)
                    }
                }
                Text(post.body)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle("Post")
        .navigationBarTitleDisplayMode(.inline)
    }
}
