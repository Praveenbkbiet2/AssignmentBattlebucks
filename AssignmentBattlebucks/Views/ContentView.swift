//
//  ContentView.swift
//  AssignmentBattlebucks
//
//  Created by Praveen Verma on 10/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                PostsListView()
                    .navigationTitle("Posts")
            }
            .tabItem {
                Label("Posts", systemImage: "list.bullet")
            }

            NavigationStack {
                FavoritesListView()
                    .navigationTitle("Favorites")
            }
            .tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(PostsViewModel())
}
