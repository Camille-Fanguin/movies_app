//
//  SwiftUIView.swift
//  Movies
//
//  Created by yves on 22/06/2023.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var movieVM: MovieSearchViewModel
    @StateObject var vm = MovieDetailsViewModel()
    
    @State var movieSearched: [AirTableSecondFloor]? = []
    @State var textContent: String = ""
    @State var btnclick:Bool = false
    @State var showingSheet:Bool = false
    @State var movieID: Int = 502356
    
    var movies: [AirTableSecondFloor]? = [AirTableSecondFloor(fields: JSONInfo(id: "001", title: "Asterix", year: "2000"))]
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("Background"))
                .ignoresSafeArea(.all)
            VStack(alignment:.center){
                AddSearchBar(textContent: $textContent, btnState: $btnclick)
                
                // NAVIGATION VIEW :
                
                NavigationView(content: {
                    VStack{
                        
                        // Condition pour que Search View s'affiche:
                        // Si textContent vide -> affiche ça :
                        
                        if(textContent.isEmpty){
                            
                            // Affichage par défaut :
                            
                            Text("En panne d'idées ? Laissez nous rerchercher un film pour vous:").foregroundColor(.white)
                                .font(.custom("Graphik compact", size: 24)).foregroundColor(.white)
                            VStack{
                                HStack{
//                                    Image(systemName: "arrow.clockwise")
//                                        .foregroundColor(.white)
//                                        .font(.largeTitle)
//                                        .frame(width:20, height: 20)
                                }
                                //                                ZStack{
                                //                                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: CGFloat(5.0)).foregroundColor(Color("Background")).frame(width:299, height:48).padding(10)
                                //                                        .foregroundColor(.white)
                                //
                                //                                    Text("Search movies").foregroundColor(.white)
                                //                                        .font(.system(size: 24))
                                //                                }
                            }
                        } else {
                            
                            // Affiche SearchResult dans ma Vue
                            SearchResults(vm: MovieDetailsViewModel(), movieID: movieID, textToSearch: $textContent, btnClick: $showingSheet)
                        }
                        
                        NavigationLink(destination:{
//                            SearchResults(vm: MovieDetailsViewModel(), movieID: $movieID, textToSearch: $textContent, btnClick: $showingSheet)
                            MovieDetailsView(movieID: $movieID)
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: CGFloat(5.0)).foregroundColor(Color("Background")).frame(width:299, height:48).padding(10)
                                    .foregroundColor(.white)
                                
                                Text("Search movies").foregroundColor(.white)
                                    .font(.system(size: 24))
                            }
                        }
                        ).fullScreenCover(isPresented: $showingSheet){
                            if let movie1 = vm.movieDetail {
                                FavorisView()
                            }
                        }
                    }
                }
                ).foregroundColor(.white)
                    
            }
        }
        } // fin de ma ZStack
        
}

struct SearchResults: View {
    @ObservedObject var vm: MovieDetailsViewModel
    var movieID: Int
    @Binding var textToSearch: String
    @Binding var btnClick: Bool
    @EnvironmentObject var movieVM: MovieSearchViewModel
    var movies: [AirTableSecondFloor]?
    var body: some View{
        VStack{
            if let movies = movieVM.movieSearched{
                List(movies){ movie in
                    VStack{
                        HStack{
                            Text(movie.fields.title)
                                .font(.title)
                            Text(movie.fields.year)
                                .font(.title2)
                            //Text(String(movie.fields.actors.first!))
                            Text(movie.fields.id ?? "")
                        }.padding()
                            .frame(maxWidth: 348, minHeight: 48)
                            .cornerRadius(10).background(.gray)
                            .padding(.bottom, 10)
                        Button("Voir + de détail"){
                            if let movie_id = movie.fields.id{
                                //movieID = Int(movie_id) ?? 0
                            }
                            btnClick.toggle()
                        }.buttonStyle(.plain)
                    }
                }
                .navigationTitle("Search results").navigationBarTitleDisplayMode(.inline)
                .refreshable{
                    Task{
                        await movieVM.fetchMovies()
                    }
                }
            }
        }
    }
}
    
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
            .environmentObject(MovieSearchViewModel(movies: []))
    }
}
