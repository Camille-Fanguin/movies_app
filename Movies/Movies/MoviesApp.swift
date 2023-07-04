//
//  MoviesApp.swift
//  Movies
//
//  Created by Apprenant83 on 21/06/2023.
//

import SwiftUI

@main
struct MoviesApp: App {
    var moviesVM:MoviesViewModel = MoviesViewModel()
    var mv: MovieSearchViewModel = MovieSearchViewModel()
    var body: some Scene {
        WindowGroup {
            TabBarView(ProfileName: .constant("Jane Doe")) // Pseudo de profil
                .environmentObject(moviesVM)
                .environmentObject(mv)
        }
    }
}
