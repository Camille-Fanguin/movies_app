//
//  FavoriteMoviesVM.swift
//  Movies
//
//  Created by yves on 05/07/2023.
//

import Foundation

class FavoriteMoviesVM: ObservableObject {
    @Published var movies:[Movie] = []
    
    func getMovies() async -> [Movie]?{
        return self.movies
    }
    func addMovieToFav(entree:Movie?) async {
        if let entree{
            self.movies.append(entree)
        }
    }
    
    func deleteMovie(id:Int) {
        self.movies.removeAll { movie in
            movie.id == id
        }
    }
    
    
    func searchMovies(movieTitle: String){
//        var m_title = movie.title
        var movies = self.movies
//            print(type(of: movies))
            //print(movies)
            print("movies was searched")
            return self.movies = movies.filter{ $0.title.contains(movieTitle) ?? false }
            
        }
    func toggleMovie(movieTitle: String) -> [Movie]{
//        var movieSearch: [Movie]
        let movieSearch = self.movies.filter{ $0.title.contains(movieTitle) ?? false }
        //if(movieSearch.first?.title == movieTitle){
        print(movieSearch)
        if (movieSearch != nil){
            if(movieSearch.count != 0){
                self.deleteMovie(id:movieSearch[0].id)
            }
        }
        return movieSearch
            //self.movies.removeLast()
            //}
        }
    }
