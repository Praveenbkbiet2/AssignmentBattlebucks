//
//  AssignmentBattlebucksApp.swift
//  AssignmentBattlebucks
//
//  Created by Praveen Verma on 10/2/25.
//

import SwiftUI

@main
struct AssignmentBattlebucksApp: App {
    @StateObject private var vm = PostsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
