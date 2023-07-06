//
//  MovieDetailsModelView.swift
//  Movies
//
//  Created by Marc on 26/06/2023.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    private let endpoint = "https://api.themoviedb.org/3"
    private let language = "fr-FR"
    
    @Published var movieDetail: Movie?
    @Published var trailerKey: String?
    @Published var movieCredits: Credits?
    
    func getMovieDetails(movieID: Int) async {
        guard let url = URL(string: "\(endpoint)/movie/\(movieID)?api_key=\(apiKey)&language=\(language)") else { return }
        
        print("Get Movie Details for \(movieID)")
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
//            if let jsonData = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
//                print(jsonData)
//            }
            
            guard let decoded = try? JSONDecoder().decode(Movie.self, from: data) else {
                print("Get Movies Details : Error decoding Movie")
                return
            }
            
            self.movieDetail = decoded
        } catch {
            print("Error")
        }
    }
    
    func getMovieCredits(movieID: Int) async {
        guard let url = URL(string: "\(endpoint)/movie/\(movieID)/credits?api_key=\(apiKey)&language=\(language)") else { return }
        print("Get Movie Credits for \(movieID)")

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let jsonData = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                print(jsonData)
            }
            
            guard let decoded = try? JSONDecoder().decode(Credits.self, from: data) else {
                print("Get Movie Credits : Error decoding Credits")
                return
            }
            
           
            
            self.movieCredits = decoded
            
        } catch {
            print("Error")
        }
    }
    
    func getMovieTrailer(movieID: Int) async {
        guard let url = URL(string: "\(endpoint)/movie/\(movieID)/videos?api_key=\(apiKey)&language=\(language)") else { return }
        print("Get Movie Trailer for \(movieID)")

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let decoded = try? JSONDecoder().decode(Trailer.self, from: data) else {
                print("Get Movie Trailer : Error decoding Trailer")
                return
            }
            
            if let jsonData = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                print(jsonData)
            }
            
            let trailerKey = decoded.results.filter { item in
                return item.type == "Trailer" && item.official == true
            }
            
            if !trailerKey.isEmpty {
                self.trailerKey = trailerKey[0].key
            }
        } catch {
            print("Error")
        }
    }
}
