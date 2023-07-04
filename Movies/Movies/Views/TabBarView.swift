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
    var defaulting = UIImage(named: "ProfilePicture")!
    @Binding var ProfileName: String
    
    @State private var activeTab: Screen = .movies
    
    var body: some View {
        NavigationStack {
            TabView(selection: $activeTab) {
                MoviesView()
                    .environmentObject(FilmsViewModel())
                    .tabItem {
                        Image(systemName: "popcorn")
                        Text("Films")
                    }
                    .tag(Screen.movies)
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Recherche")
                    }
                    .tag(Screen.search)
                
                FavorisView()
                    .tabItem {
                        Image(systemName: "bookmark")
                        Text("Favoris")
                    }
                    .tag(Screen.favorite)
                
                ProfileView(ProfileName: $ProfileName, selectedImage: .constant(defaulting))
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profil")
                    }
                    .tag(Screen.profile)
                
            }
            .onAppear() {
                setupTabBarAppearance()
            }
            .tint(.white)
        }
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(ProfileName: .constant("Jane Doe")) // Pseudo de profil
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
