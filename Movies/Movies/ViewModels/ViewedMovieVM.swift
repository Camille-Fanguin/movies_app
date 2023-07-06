//
//  ViewedMovieVM.swift
//  Movies
//
//  Created by Djihane on 04/07/2023.
//

import Foundation
 class ViewdMovies: ObservableObject {
    @Published var viewds: [Movie] = []
    
    private let key = "ViewdMovies"
    
    init() {
        loadViewds()
    }
    
    func addToViewds(movie: Movie) {
        viewds.append(movie)
        saveViewds()
    }
    
    private func saveViewds() {
        if let encoded = try? JSONEncoder().encode(viewds) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    private func loadViewds() {
        if let data = UserDefaults.standard.data(forKey: key) {
            if let decoded = try? JSONDecoder().decode([Movie].self, from: data) {
                viewds = decoded
            }
        }
    }
}

