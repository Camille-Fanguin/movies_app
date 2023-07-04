//
//  MovieStatsVM.swift
//  Movies
//
//  Created by Apprenant 24 on 29/06/2023.
//

import Foundation


class MovieStatsVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    var data:[StatCharts] {
        [
           .init(Genre:action, NumberOfMovies: numberMoviesGenre(genreOfMovie: action)),
           .init(Genre:drama, NumberOfMovies: numberMoviesGenre(genreOfMovie: drama)),
           .init(Genre:sf, NumberOfMovies: numberMoviesGenre(genreOfMovie: sf)),
 ]
    }
    //ajouter une fonction ajouter film
  //  func numberMoviesGenre(genreOfMovie : Genre) -> Int
//    { if
//        //voir atelier filtre et compter le nb d'element du tableau filtré
//
//        return 0
//
//    }
   
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
}

