//
//  AddSearchBar.swift
//  Movies
//
//  Created by yves on 27/06/2023.
//

import SwiftUI

struct AddSearchBar: View {
    @EnvironmentObject var movieVM: MovieSearchViewModel
    @ObservedObject var vmd = MovieDetailsViewModel()
    @ObservedObject var vm = MoviesViewModel()
    @Binding var textContent: String
    @Binding var btnState: Bool
    @Binding var movieID: Int
    @FocusState var focus: Bool
    var body: some View {
        HStack{
            TextField("Rechercher un film, un acteur, une actrice...", text:$textContent)
                .font(.custom("Graphik compact", size: 20))
                .padding(.leading, -10).padding()
                .textSelection(.enabled)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, minHeight:28, maxHeight:28).onSubmit {
                    // change l'etat de mon bouton
                    self.btnState.toggle()
                }.focused($focus)
            Button(action: {
                // si textContent n'est pas vide alors affiche mes résultats
                if(!textContent.isEmpty){
                    self.btnState.toggle()
                }
                
            }, label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("DarkMagenta"))
                    .shadow(color: .black, radius:1)
            }).buttonStyle(.plain)
        }
        .padding(24)
        .background(Color(.systemGray6))
        .frame(maxWidth: 348, minHeight: 48)
        .cornerRadius(10)
        .padding(.bottom, 10)
        .onAppear {
            Task{
                self.focus = true
            }
        }
        .onSubmit {
            Task {
                await vmd.getMovieDetails(movieID: movieID)
                await vmd.getMovieCredits(movieID: movieID)
                await vmd.getMovieTrailer(movieID: movieID)
                print("Text content is \(textContent)")
                if let vm = vmd.movieDetail?.id{
                    movieID = vm
                }
            }
        }
    }
}

struct AddSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        AddSearchBar(textContent: .constant(""), btnState: .constant(false), movieID: .constant(10))
            .environmentObject(MovieSearchViewModel(movies: []))
    }
}
