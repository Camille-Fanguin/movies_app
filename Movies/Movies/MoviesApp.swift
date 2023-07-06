//
//  MoviesApp.swift
//  Movies
//
//  Created by Apprenant83 on 21/06/2023.
//

import SwiftUI

@main
struct MoviesApp: App {
    @StateObject var moviesVM:MoviesViewModel = MoviesViewModel()
    @StateObject var mv: MovieSearchViewModel = MovieSearchViewModel()
    @StateObject var movieStat: MovieStatsVM = MovieStatsVM()
    var defaulting = UIImage(named: "ProfilePicture")!
    
    var body: some Scene {
        WindowGroup {
            
            TabBarView(ProfileName: .constant("Jane Doe"), selectedImage: .constant(defaulting)) // Pseudo de profil & Image profil
                .environmentObject(moviesVM)
                .environmentObject(mv)
                .environmentObject(movieStat)
        }
    }
}
