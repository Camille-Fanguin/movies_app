//
//  Credits.swift
//  Movies
//
//  Created by Marc on 27/06/2023.
//

import Foundation

struct Credits: Codable {
    let id: Int
    let cast: [Actor]
}

struct Actor: Codable, Hashable {
    let id: Int
    let name: String
    let profile_path: String
    let character: String
}

