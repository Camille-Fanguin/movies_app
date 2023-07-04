//
//  AddSearchBar.swift
//  Movies
//
//  Created by yves on 27/06/2023.
//

import SwiftUI

struct AddSearchBar: View {
    @EnvironmentObject var movieVM: MovieSearchViewModel
    @Binding var textContent: String
    @Binding var btnState: Bool
    var body: some View {
        HStack{
            TextField("Rechercher un film, un acteur, une actrice...", text:$textContent)
                .font(.custom("Graphik compact", size: 24))
                .padding([.top, .leading], 10)
                .textSelection(.enabled)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, minHeight:28, maxHeight:28).onSubmit {
                    // récupère un tableau de movies en fonction du contenu de mon textField
                    Task{
                        await movieVM.searchMovies(movieToSearch: textContent)
                    }
                    // affiche la liste des résultats
                    self.btnState.toggle()
                }
            Button(action: {
                // action : affiche la liste des résultats
                self.btnState.toggle()
                
            }, label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                    .shadow(color: .black, radius:1)
            }).buttonStyle(.plain)
        }
        .padding(24)
        .background(Color(.systemGray6))
        .frame(maxWidth: 348, minHeight: 48)
        .cornerRadius(10)
        .padding(.bottom, 10)
//        .onAppear {
//            Task{
//                await movieVM.fetchMovies()
//            }
//        }
    }
}

struct AddSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        AddSearchBar(textContent: .constant(""), btnState: .constant(false))
            .environmentObject(MovieSearchViewModel(movies: []))
    }
}
