//
//  PostsListView.swift
//  AssignmentBattlebucks
//
//  Created by Praveen Verma on 10/2/25.
//

import SwiftUI

struct PostsListView: View {
    @EnvironmentObject var vm: PostsViewModel
    @State private var rotation: Double = 0 

    var body: some View {
        VStack(spacing: 0) {

            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.black.opacity(0.9))
                    .padding(5)

                TextField("Search by title...", text: $vm.searchText)
                    .textFieldStyle(.plain)
                    .padding(.vertical, 8)
                   
            }
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(10)
            
            
            if vm.isLoading && vm.posts.isEmpty {
                ProgressView("Loading posts...")
                    .frame(maxHeight: .infinity)
            } else if let error = vm.errorMessage, vm.posts.isEmpty {
                VStack {
                    Text("Error: \(error)")
                    Button("Retry") { Task { await vm.fetchPosts() } }
                }
            } else {
                List(vm.filteredPosts) { post in
                    NavigationLink(value: post) {
                        PostRow(post: post)
                    }
                }
                .listStyle(.plain)
                .refreshable {
                    await vm.fetchPosts()
                }
                .navigationDestination(for: Post.self) { post in
                    PostDetailView(post: post)
                }
            }
        }
        .task {
            if vm.posts.isEmpty {
                await vm.fetchPosts()
            }
        }
    }
}

 

#Preview {
    ContentView()
        .environmentObject(PostsViewModel())
}
