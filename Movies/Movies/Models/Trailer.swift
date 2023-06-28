//
//  Trailer.swift
//  Movies
//
//  Created by Marc on 26/06/2023.
//

import Foundation

struct Trailer: Codable {
    let id: Int
    let results: [Result]
}

struct Result: Codable {
    let id: String
    let type: String
    let key: String
    let official: Bool
}
