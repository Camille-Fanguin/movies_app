//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Marc on 27/06/2023.
//

import Foundation

class MoviesViewModel: ObservableObject {
    private let endpoint = "https://api.themoviedb.org/3"
    private let language = "fr-FR"
    
    @Published var movies: [Movie] = []
    
    func getPopularMovies() async {
        guard let url = URL(string: "\(endpoint)/movie/popular?api_key=\(apiKey)&language=\(language)") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let decoded = try? JSONDecoder().decode([Movie].self, from: data) else { return }
            
            self.movies = decoded
        } catch {
            print("Error")
        }
    }
}
