//
//  SwiftUIView.swift
//  Movies
//
//  Created by yves on 22/06/2023.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var movieVM: MovieSearchViewModel
    @StateObject var vm = MoviesViewModel()
    @StateObject var vmd = MovieDetailsViewModel()
    //@State var movieSearched: [AirTableSecondFloor]? = []
    @State var textContent: String = ""
    @State var btnclick:Bool = false
    @State var showingSheet:Bool = false
    @State var movieID: Int = 0
//    var movies: [AirTableSecondFloor]? = [AirTableSecondFloor(fields: JSONInfo(id: "001", title: "Asterix", year: "2000"))]
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("Background"))
                .ignoresSafeArea(.all)
            VStack(alignment:.center){
                AddSearchBar(textContent: $textContent, btnState: $btnclick, movieID: $movieID)
                
                NavigationView(content: {
                    
                    
                    
                    
                    VStack{
                        
                        
                        if(textContent.isEmpty){
                            
                            // Affichage par défaut :
                            
                            Text("En panne d'idées ? Laissez nous recommander des films").foregroundColor(.white)
                                .font(.custom("Graphik compact", size: 20)).foregroundColor(.white)
                            
                            
                            
                        } else {
                            
                            // Affiche SearchResult dans ma Vue
                            if(btnclick){
                                SearchResults(vmd: MovieDetailsViewModel(), vm: MoviesViewModel(), movieID: $movieID, textToSearch: $textContent, btnClick: $btnclick, showModal: $showingSheet)
                            }
                        }
                        
                        NavigationLink(destination:{
                            MovieDetailsView(movieID: $movieID)
                            //SearchResults(vm: MovieDetailsViewModel(), movieID: $movieID, textToSearch: $textContent, btnClick: $showingSheet)
                            
                        }, label: {
                        }
                        )
                        .sheet(isPresented: $showingSheet){
                            if movieID != nil {
                                MovieDetailsView(movieID: $movieID)
                            }
                        }
                    }
                }
                ).foregroundColor(.white)
                    
            }
        }.onAppear{
            Task{
                //await vm.getMovieSearch(textToSearch: textContent)
                await vmd.getMovieDetails(movieID:movieID)
                await vmd.getMovieTrailer(movieID: movieID)
            }
       }
        } // fin de ma ZStack
        
}

struct SearchResults: View {
    @ObservedObject var vmd: MovieDetailsViewModel
    @ObservedObject var vm: MoviesViewModel
    @Binding var movieID: Int
    @Binding var textToSearch: String
    @Binding var btnClick: Bool
    @Binding var showModal: Bool
    @EnvironmentObject var movieVM: MovieSearchViewModel

    var body: some View{
        
            Text("")
            .padding(.leading, 10)
        VStack(alignment:.center){
            Text("Search Results")
                .font(.title3)
            List(vm.movies){ movie in
                    VStack{
                        HStack{
                            Text(movie.title ?? "")
                                .foregroundColor(Color("Gray"))
                                .opacity(1.0)
                                .font(.title2)
                            //Text(movie.release_date ?? "")
                            //.font(.title2)
                        }.padding()
                            .frame(maxWidth: 348, minHeight: 48)
                            .cornerRadius(10).background(Color("Gray 2"))
                            .padding(.bottom, 10)
                        Button("Voir + de détail"){
                            showModal = true
                            movieID = vm.movies.first!.id
                            btnClick.toggle()
                        }.buttonStyle(.plain).foregroundColor(Color("DarkMagenta"))
                    }
                }
            
        }
        .navigationTitle("").navigationBarTitleDisplayMode(.automatic)
        .onAppear{
            Task{
                //await movieVM.fetchMovies()
                await vm.getMovieSearch(marioText:textToSearch)
                await vmd.getMovieDetails(movieID: movieID)
                await vmd.getMovieCredits(movieID: movieID)
                await vmd.getMovieTrailer(movieID: movieID)
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
}
