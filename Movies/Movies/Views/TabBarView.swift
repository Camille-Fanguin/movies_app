//
//  TabBarView.swift
//  Movies
//
//  Created by Marc on 27/06/2023.
//

import SwiftUI

enum Screen {
    case movies
    case search
    case favorite
    case profile
}

struct TabBarView: View {
    @State private var activeTab: Screen = .movies
    
    var body: some View {
        TabView(selection: $activeTab) {
            MoviesView()
                .tabItem {
                    Image(systemName: "popcorn")
                    Text("Films")
                }
                .tag(Screen.movies)
            MoviesView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Recherche")
                }
                .tag(Screen.movies)
            MoviesView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Favoris")
                }
                .tag(Screen.movies)
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profil")
                }
                .tag(Screen.movies)
        }
        .onAppear() {
            setupTabBarAppearance()
        }
        .tint(.white)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

extension TabBarView {
    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(Color("Background"))
        UITabBar.appearance().backgroundColor = UIColor(Color("Background"))
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.gray)
        UITabBar.appearance().standardAppearance = appearance
    }
}
