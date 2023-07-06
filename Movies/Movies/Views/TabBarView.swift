//
//  TabBarView.swift
//  Movies
//
//  Created by Marc on 27/06/2023.
//
// ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! //
// ! ! Preview Xcode crash, utilisation du simulateur nécessaire ! ! //
// ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! //

import SwiftUI

enum Screen {
    case movies
    case search
    case favorite
    case profile
}

struct TabBarView: View {
    @Binding var ProfileName: String
    @Binding var selectedImage: UIImage?
    
    @State private var activeTab: Screen = .movies
    
    var body: some View {
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
                
                ProfileView(ProfileName: $ProfileName, selectedImage: $selectedImage)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profil")
                    }
                    .tag(Screen.profile)
                
            }
            .onAppear() {
                setupTabBarAppearance()
            }
            .accentColor(Color("SunsetOrange"))
        }
    }


//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView(ProfileName: .constant("Jane Doe"), selectedImage: .constant(defaulting))
//    }
//}

extension TabBarView {
    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(Color("Background"))
        UITabBar.appearance().backgroundColor = UIColor(Color("Background"))
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.gray)
        UITabBar.appearance().standardAppearance = appearance
    }
}

