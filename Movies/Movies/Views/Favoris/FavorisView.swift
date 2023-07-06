//
//  FavorisView.swift
//  Movies
//
//  Created by yves on 22/06/2023.
//

import SwiftUI

struct FavorisView: View {
    private let imageBaseUrl = "https://image.tmdb.org/t/p/original"
    @EnvironmentObject var movieStat: MovieStatsVM
    @StateObject var vm: MoviesViewModel = MoviesViewModel()
    @StateObject var vmd: MovieDetailsViewModel = MovieDetailsViewModel()
    @StateObject var vmf: FavoriteMoviesVM = FavoriteMoviesVM()
    @State var showBtn: Bool = false
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 20) {
                    ForEach(vmf.movies) { movie in
                        VStack {
                            if(showBtn){
                                Button(action: {
                                    Task{
                                        await vmf.getMovies()
//                                        await vmf.toggleMovie(movieTitle: "Mario")
                                    }
                                    showBtn = false
                                }, label: {
                                    Image(systemName: "bookmark.circle.fill")
                                        .font(.largeTitle)
                                })
                            } else {
                                Button(action: {
                                    Task{
                                        //await vmf.getMovies()
                                        vmf.toggleMovie(movieTitle: "Mario")
                                    }
                                    showBtn = true
                                }, label: {
                                    Image(systemName: "bookmark.circle")
                                        .font(.largeTitle)
                                })
                            }
                            if let backdropPath = movie.backdropPath {
                                
                                let imageUrl = imageBaseUrl + backdropPath
                                
                                AsyncImage(url: URL(string: imageUrl)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    //Text(movie.title ?? "")
                                        .font(.caption)
                                } placeholder: {
                                    Rectangle().foregroundColor(.gray)
                                }
                            } else {
                                Rectangle().foregroundColor(.gray)
                            }
                        }
                        .frame(width: 95, height: 138)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(6)
                        .padding(5)
                    }
                }
                .padding(10)
            }
            .onAppear(){
                Task{
                    //await vm.getPopularMovies()
                    await vmd.getMovieDetails(movieID: 502356) // type MovieVD
                    
                    
                    if let movie = vmd.movieDetail {
                        await vmf.addMovieToFav(entree: movie) // type Movie
                    }
                    
                }
            }
            .refreshable{
                if(showBtn){
                    await vmf.toggleMovie(movieTitle: "Mario")
                }
                print("le nombre de films en favori est : \(vmf.movies.count)")
            }
        }
    }
    
    struct FavorisView_Previews: PreviewProvider {
        static var previews: some View {
            FavorisView()
                .environmentObject(MovieStatsVM())
        }
    }
}
