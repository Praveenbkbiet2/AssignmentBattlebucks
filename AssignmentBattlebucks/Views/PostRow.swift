//
//  PostRow.swift
//  AssignmentBattlebucks
//
//  Created by Praveen Verma on 10/2/25.
//

import SwiftUI

struct PostRow: View {
    let post: Post
    @EnvironmentObject var vm: PostsViewModel

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                Text("User: \(post.userId)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
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
            .buttonStyle(.plain)
        }
    }
}
