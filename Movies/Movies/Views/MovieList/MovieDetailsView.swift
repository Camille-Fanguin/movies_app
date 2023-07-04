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
                        
                        HStack {
                            Text("\(movie.runtime ?? 0)min")
                            Text("•")
                            Text(movie.title)
                            Spacer()
                        }
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "calendar")
                            Text(movie.releaseDate)
                            Spacer()
                        }
                        .font(.caption)
                        .padding(.horizontal)
                        
                        if let trailer = vm.trailerKey {
                            NavigationLink(destination: TrailerView(videoID: vm.trailerKey ?? "")) {
                                ButtonTrailerView()
                            }
                        }
                        
                        HStack {
                            Text("Synopsis")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            Spacer()
                        }
                        
                        Text(movie.overview)
                            .font(.caption2)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                        
                        HStack {
                            Text("Acteurs")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            Spacer()
                        }
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(vm.movieCredits?.cast ?? [], id: \.self) { item in
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
                                    Text(item.name)
                                        .foregroundColor(.red)
                                }
                            }
                        }
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
            Text(vm.movieDetail?.originalTitle ?? "")
                .font(.title2)
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
    }
}
