//
//  MovieStatsVM.swift
//  Movies
//
//  Created by Apprenant 24 on 29/06/2023.
//

import SwiftUI

class MovieStatsVM: ObservableObject {
    @AppStorage("ViewdMovies") var movies: [Movie] = []
    
    
    var data:[StatCharts] {
        [
            .init(Genre:action, NumberOfMovies: numberMoviesGenre(genreOfMovie: action)),
            .init(Genre:drama, NumberOfMovies: numberMoviesGenre(genreOfMovie: drama)),
            .init(Genre:Crime, NumberOfMovies: numberMoviesGenre(genreOfMovie: Crime)),
            .init(Genre:Romance, NumberOfMovies: numberMoviesGenre(genreOfMovie: Romance)),
            .init(Genre:Familial, NumberOfMovies: numberMoviesGenre(genreOfMovie: Familial)),
            .init(Genre:Animation, NumberOfMovies: numberMoviesGenre(genreOfMovie: Animation)),
            .init(Genre:Comédie, NumberOfMovies: numberMoviesGenre(genreOfMovie: Comédie)),
        ]
    }

    
    func numberMoviesGenre(genreOfMovie: Genre) -> Int {
        
        if movies.isEmpty {
            return 0
        } else {
            
            return movies.filter { $0.genres.contains { genre in
                return genre.name == genreOfMovie.name}
            }.count
        }
    }
    
    // Fonction pour calculer le temps total, le nombre de films et le genre préféré
    func calculateStatsMovies() -> (totalTime: Int, moviesNumber: Int, favGenre: String) {
        var totalTime = 0
        var moviesNumber = 0
        var favGenre = ""
        var genreCounts = [String: Int]() //compter  les genres
        
        for movie in movies {
            totalTime += movie.runtime!
            moviesNumber += 1
            //pour erreur genre
            for genre  in movie.genres {
                if let count = genreCounts[genre.name]{
                    genreCounts[genre.name] = count + 1
                } else {
                    genreCounts[genre.name] = 1
                }
            }
        }
        
        
        //rechercher les genres les plus vus
        var maxCount = 0
        for (genre, count) in genreCounts {
            if count > maxCount {
                maxCount = count
                favGenre = genre
            }
        }
        
        return (totalTime, moviesNumber, favGenre)
    }
    
    private let key = "ViewdMovies"
    
    func addToViewds(movie: Movie) {
        if !movies.contains(where: { m in
            movie.id == m.id
        })
        {
            movies.append(movie)
        }
        else
        {
            deleteViewds(movie: movie)
        }
        
    }
    
    func deleteViewds(movie:Movie){
        movies.removeAll { m in
            movie.id == m.id
        }
    }
}
extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
func minutesToHours(minutes: Int) -> (hours: Int, minutes: Int) {
    let hours = minutes / 60
    let remainingMinutes = minutes % 60
    return (hours, remainingMinutes)
}
