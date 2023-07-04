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
    
    
    /////variables pour afficher listes de films//////////////////

    @Published var movies: [MovieVD] = []
    @Published var moviesUp: [MovieVD] = []
    @Published var moviesNow: [MovieVD] = []
   
    
    
    ///////////////:films toujours à l'affiche////////////////////////////////////////
    func getPopularMovies() async {
        print("Get Popular Movies")
        guard let url = URL(string: "\(endpoint)/movie/popular?api_key=\(apiKey)&language=\(language)") else {
            print("hello")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let decoded = try? JSONDecoder().decode(MoviesResponse.self, from: data) else {
                print("getPopularMovies - Error decoding MoviesResponse")
                return }
            
            self.movies = decoded.results
            print(movies.count)
        } catch {
            print("Error")
        }
    }
    
    
    /////////////////// prochains films ///////////////////////////////////////////////////////:
    func getUpMovies() async {
        print("Get Up Movies")
        guard let url = URL(string: "\(endpoint)/movie/upcoming?api_key=\(apiKey)&language=\(language)") else {
            print("hello")
            
            return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            
            guard let decoded = try? JSONDecoder().decode(MoviesResponse.self, from: data) else {
                print("getUpMovies - Error decoding MoviesResponse")
                return }
            
            self.moviesUp = decoded.results
            print(moviesUp.count)
        } catch {
            print("Error")
        }
    }
    
   ///////films diffusés actuellement//////////////////////////////////////////////////
    func getNowMovies() async {
        print("Get Now Movies")
        guard let url = URL(string: "\(endpoint)/movie/now_playing?api_key=\(apiKey)&language=\(language)") else {
            print("hello")
            
            return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let decoded = try? JSONDecoder().decode(MoviesResponse.self, from: data) else {
                print("getNowMovies - Error decoding MoviesResponse")
                return }
            
            self.moviesNow = decoded.results
            print(moviesNow.count)
        } catch {
            print("Error")
        }
    }
    
    
    
}
