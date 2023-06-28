//
//  Movie.swift
//  Movies
//
//  Created by Marc on 25/06/2023.
//

import Foundation

struct Genre: Codable {
    let id: Int
    let name: String
}

struct Movie: Codable {
    let id: Int
    let original_title: String
    let backdrop_path: String?
    let runtime: Int?
    let overview: String
    let poster_path: String
    let release_date: String
    let vote_average: Float
    let genres: [Genre]
}
