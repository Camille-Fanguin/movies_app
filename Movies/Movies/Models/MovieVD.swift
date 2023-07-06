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

struct MovieVD: Codable, Identifiable { //ajout identifiable
    let id: Int
    let originalTitle: String?
    let title: String?
    let backdropPath: String?
    let runtime: Int?
    let overview: String?
    let posterPath: String?
    let release_date: String?
    let vote_average: Float?
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case title
        case backdropPath = "backdrop_path"
        case runtime
        case overview
        case posterPath = "poster_path"
        case release_date
        case vote_average
    }
}
/*
 {
     adult = 0;
     "backdrop_path" = "/44immBwzhDVyjn87b3x3l9mlhAD.jpg";
     "genre_ids" =     (
         27,
         9648,
         53
     );
     id = 934433;
     "original_language" = en;
     "original_title" = "Scream VI";
     overview = "Apr\U00e8s avoir frapp\U00e9 \U00e0 trois reprises \U00e0 Woodsboro, apr\U00e8s avoir terroris\U00e9 le campus de Windsor et les studios d\U2019Hollywood, Ghostface a d\U00e9cid\U00e9 de s\U00e9vir dans Big Apple, mais dans une ville aussi grande que New York personne ne vous entendra crier\U2026";
     popularity = "331.167";
     "poster_path" = "/yQw8BtQedzm5aUo9zQCUMxQBtIJ.jpg";
     "release_date" = "2023-03-08";
     title = "Scream VI";
     video = 0;
     "vote_average" = "7.2";
     "vote_count" = 1440;
 }
 */
