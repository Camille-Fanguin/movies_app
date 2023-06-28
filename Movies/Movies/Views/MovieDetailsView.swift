//
//  MovieDetailsView.swift
//  Movies
//
//  Created by Marc on 22/06/2023.
//

import SwiftUI

struct MovieDetailsView: View {
    private let imageBaseUrl = "https://image.tmdb.org/t/p/original"
    
    var movieID: Int = 502356
    
    @StateObject var vm = MovieDetailsViewModel()

    var body: some View {
        NavigationStack {
            GeometryReader { geo in
            ScrollView {
                ZStack {
                    AsyncImage(url: URL(string: "\(imageBaseUrl)\(vm.movieDetail?.backdrop_path ?? "")")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
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
                    Text("\(vm.movieDetail?.runtime ?? 0)min")
                    Text("•")
                    Text(vm.movieDetail?.genres[0].name ?? "")
                    Spacer()
                }
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "calendar")
                    Text(vm.movieDetail?.release_date ?? "")
                    Spacer()
                }
                .font(.caption)
                .padding(.horizontal)

                
                NavigationLink(destination: TrailerView(videoID: vm.trailerKey ?? "")) {
                    ButtonTrailerView()
                }
                
                HStack {
                    Text("Synopsis")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    Spacer()
                }
                
                Text(vm.movieDetail?.overview ?? "")
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
//                            AsyncImage(url: URL(string: "\(imageBaseUrl)\(item.profile_path)")) { image in
//                                image
//                                    .resizable()
//                            } placeholder: {
//                                Image(systemName: "")
//                            }
                            Text(item.name)
                                .foregroundColor(.red)
                        }
                    }
                }
                
                
            }
            .background(Color("Background"))
            .foregroundColor(.white)
            .edgesIgnoringSafeArea(.all)
        }
        }
        .task {
            await vm.getMovieDetails(movieID: movieID)
            await vm.getMovieTrailer(movieID: movieID)
            await vm.getMovieCredits(movieID: movieID)
        }
    }
    
    private var titleOverlay: some View {
        HStack {
            Text(vm.movieDetail?.original_title ?? "")
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
        MovieDetailsView()
    }
}
