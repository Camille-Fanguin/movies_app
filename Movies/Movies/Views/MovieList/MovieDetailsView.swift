//
//  MovieDetailsView.swift
//  Movies
//
//  Created by Marc on 22/06/2023.
//

import SwiftUI

struct MovieDetailsView: View {
    private let imageBaseUrl = "https://image.tmdb.org/t/p/original"
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var movieID: Int
    
    @StateObject var vm = MovieDetailsViewModel()
    @ObservedObject var viewdMovies = ViewdMovies()
    @EnvironmentObject var moviestat : MovieStatsVM
    @StateObject var vmf = FavoriteMoviesVM()
    
    let randomImdb = Float.random(in: 7.0..<9.0)
    
//    @State private var isOnFavori = false // film favori (bookmark)
//    @State private var isOnPasVu = false // film pas vu (checkmark)
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ScrollView {
                    if let movie = vm.movieDetail {
                        ZStack {
                            AsyncImage(url: URL(string:"\(imageBaseUrl)\(movie.posterPath)")){image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .scaledToFit()
                                    .frame(width: geo.size.width, height: 350)
                                
                            } placeholder: {
                                ZStack {
                                    Rectangle().foregroundColor(.white)
                                    Image(systemName: "photo.fill")
                                        .resizable()
                                        .foregroundColor(.red)
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                        }
                        .overlay(alignment: .bottomLeading, content: {titleOverlay})
                        
                        //bouton de vu
                     
//                        Button {
//                            viewdMovies.addToViewds(movie: movie)
//                        } label: {
//                            Label("J'ai vu ce film", systemImage: "bookmark.fill")
//                        }
                       // .buttonStyle(.bordered)
                        
                        //.buttonStyle(GrowingButton())
                        
                        HStack {
                            Text("\(movie.runtime ?? 0)min")
                            Text("•")
                            Text(movie.originalTitle)
                            Text("•")
                            Text("IMDb : \(randomImdb, specifier: "%.1f")")
                            Spacer()
                        }
                        .font(.callout)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "calendar")
                            Text(movie.releaseDate)
                            Spacer()
                            
                            //bouton film favori à lier avec la page favori
                            Button {
                                Task{
                                    await vmf.addMovieToFav(entree: movie)
                                }
                            } label: {
                                Label("Fillm favori", systemImage: "bookmark")
                            }
                            .buttonStyle(.bordered)
                            
                            
                            Spacer()
                            
                            //Bouton page films déjà vus
                            Button {
                                moviestat.addToViewds(movie: movie)
                            } label: {
                                Label("J'ai vu ce film", systemImage: "eye")
                            }
                            .buttonStyle(.bordered)
                            // Toggle film favori
//                            Toggle("Film favori", isOn: $isOnFavori)
//                                       .toggleStyle(CheckToggleStyleFav())

                        }
                        .font(.caption)
                        .padding(.horizontal)
                        
                        HStack{
                           
                            //toggle film pas vu
//                            Toggle("Pas vu", isOn: $isOnPasVu)
//                                       .toggleStyle(CheckToggleStylePasVu())
//                            Spacer()
                        }
                        .font(.caption)
                        .padding([.leading, .bottom, .trailing])
                        
                if let trailer = vm.trailerKey {
                            NavigationLink(destination: TrailerView(videoID: trailer)) {
                                ButtonTrailerView ()
                                    .padding(.bottom)
                                    
                            }
                        }
                        
                        //Spacer()
                        
                        
//                        NavigationLink(destination: TrailerView(videoID: vm.trailerKey ?? "")) {
//                            ButtonTrailerView()
//                        }
                        
                        HStack {
                            Text("Synopsis")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding([.top, .leading, .bottom], 5.0)
                                
                                
                                
                                
                            Spacer()
                        }
                        
                        
                        Text(movie.overview)
                            //.font(.caption)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            
                            
                       
                        HStack {
                            Text("Distribution des Rôles")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding([.leading, .bottom], 5.0)
                                
                                
                                
                            Spacer()
                        }
                        .padding(.top, 14.0)
                        //.padding()
                        
                        ScrollView(.horizontal) {
                            //VStack {
                                HStack{
                                    
                                        ForEach(vm.movieCredits?.cast ?? [], id: \.self) {
                                            
                                            
                                            item in
                                            
                                            VStack{
                                            if let image = item.profile_path {
                                                AsyncImage(url: URL(string: "\(imageBaseUrl)\(image)")) { image in
                                                    image
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 80, height: 80)
                                                        .clipShape(Circle())
                                                } placeholder: {
                                                    Image(systemName: "person.circle.fill")
                                                        .resizable()
                                                        .frame(width: 80, height: 80)
                                                }
                                            } else {
                                                Image(systemName: "person.circle.fill")
                                                    .resizable()
                                                    .frame(width: 80, height: 80)
                                            }
                                            
                                            VStack(alignment: .leading){
                                                Text(item.name)
                                                    .foregroundColor(Color("SunsetOrange"))
                                    
                                                Text(item.character)
                                                    .foregroundColor(Color("Gray"))
                                                  Spacer()
                                            }
                                            .frame(width: 80, height: 80)
                                        }//VStack
                                            .padding()
                                    }//ForEach
                                }
                                
                                
                            //}//VStack
                        }
                        .padding(.top, -3.0)
                        .background(Color("Background"))
                        .foregroundColor(.white)
                        .edgesIgnoringSafeArea(.all)
                    }
                }
            }
        }.task{
                await vm.getMovieDetails(movieID: movieID)
                await vm.getMovieTrailer(movieID: movieID)
                await vm.getMovieCredits(movieID: movieID)
                print("Get Movie details, trailer and credits of: \(self.movieID)")
            
        }
        
    }
    
    private var titleOverlay: some View {
        HStack {
            Text(vm.movieDetail?.title ?? "")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .padding(.leading, 8)
                .background(.ultraThinMaterial)
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movieID: .constant(934433))
            .environmentObject(MovieStatsVM())
        
    }
}

// struc film favori
struct CheckToggleStyleFav: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
            
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "bookmark.fill" : "bookmark")
                    .foregroundStyle(configuration.isOn ? Color("SunsetOrange") : Color("Gray"))
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
    }
}


//struct GrowingButton: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding()
//            .background(Color("SunsetOrange"))
//            .foregroundStyle(.white)
//            .frame(width: 44, height: 44)
//            .clipShape(Capsule())
//            .scaleEffect(configuration.isPressed ? 1.2 : 1)
//            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
//    }
//}






//struct film pas vu
struct CheckToggleStylePasVu: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
            
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "checkmark.circle")
                    .foregroundStyle(configuration.isOn ? Color("SunsetOrange") : Color("Gray"))
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
    }
}
