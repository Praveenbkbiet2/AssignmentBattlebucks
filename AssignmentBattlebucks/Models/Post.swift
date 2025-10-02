//
//  Post.swift
//  AssignmentBattlebucks
//
//  Created by Praveen Verma on 10/2/25.
//

import SwiftUI
import Foundation

struct Post: Identifiable, Codable, Hashable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

