//
//  Movie.swift
//  Boxotop
//
//  Created by Romain Poyard on 16/06/2023.
//

import Foundation

/* ["results": [
 {
     adult = 0;
     "backdrop_path" = "/cSYLX73WskxCgvpN3MtRkYUSj1T.jpg";
     "genre_ids" =     (
         16,
         35,
         10751,
         14,
         10749
     );
     id = 976573;
     "original_language" = en;
     "original_title" = Elemental;
     overview = "Dans une ville o\U00f9 les habitants du feu, de l'eau, de la terre et de l'air cohabitent, une jeune femme fougueuse et un homme \U00e0 l'esprit vif vont d\U00e9couvrir quelque chose d'\U00e9l\U00e9mentaire : tout ce qu'ils ont en commun.";
     popularity = "1391.675";
     "poster_path" = "/rzY5kUJJ1zGfingV2oHyyxtlGNa.jpg";
     "release_date" = "2023-06-14";
     title = "\U00c9l\U00e9mentaire";
     video = 0;
     "vote_average" = "7.5";
     "vote_count" = 304;
 }
 ]
 , "page": 1, "total_results": 461, "total_pages": 24, "dates": {
     maximum = "2023-07-28";
     minimum = "2023-07-03";
 }]*/

// struct of the API Response from the JSON
struct MoviesResponse: Codable {
    let page: Int
    let results: [MovieVD]
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}



//struct of a Movie
struct Movie: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String?
    let id: Int
    let title: String
    let originalTitle, overview: String
    let runtime: Int?
    let posterPath: String
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    let genres: [Genre]
    //    let genre: String
    
    /*
     ["poster_path": /vP4t7DynrGPNwhXX8Z7Guq9FpS3.jpg,
     "genres":
        { id = 12;
        name = Aventure;
     }
     "vote_average": 6.235,
     "tagline": Regardez et vous verrez, un jour je ferai partie de votre monde !,
     "runtime": 135,
     "popularity": 854.713,
     "video": 0,
     "homepage": ,
     "id": 447277,
     "original_title": The Little Mermaid,
     "title": La Petite Sirène,
     "backdrop_path": /ribiMu3iINPxDkofErPxe8jQ8L0.jpg,
     "adult": 0,
     "overview": Les années 1830, dans les eaux d'une île fictive des Caraïbes. Ariel, la benjamine des filles du roi Triton, est une jeune sirène belle et fougueuse dotée d’un tempérament d’aventurière. Rebelle dans l’âme, elle n’a de cesse d’être attirée par le monde qui existe par-delà les flots. Au détour de ses escapades à la surface, elle va tomber sous le charme du prince Eric. Alors qu'il est interdit aux sirènes d'interagir avec les humains, Ariel sent pourtant qu’elle doit suivre son cœur. Elle conclut alors un accord avec Ursula, la terrible sorcière des mers, qui lui octroie le pouvoir de vivre sur la terre ferme, mais sans se douter que ce pacte met sa vie - et la couronne de son père - en danger...,
     "belongs_to_collection": <null>,
     "release_date": 2023-05-18]
     */
    
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalTitle = "original_title"
        case runtime
        case overview
        case posterPath = "poster_path"
        case genres
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        
    }
}
enum MediaType: String, Codable {
    case movie = "movie"
}
