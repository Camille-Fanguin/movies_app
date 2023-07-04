//
//  FavorisView.swift
//  Movies
//
//  Created by yves on 22/06/2023.
//

import SwiftUI

struct FavorisView: View {
@EnvironmentObject var vm: MovieSearchViewModel
var columns:[GridItem] = [
    GridItem(spacing:0),
    GridItem(spacing:0)
]
var body: some View {
    VStack(alignment:.center, spacing: 50){
        ScrollView(content: {
            Spacer()
            Text("Work In Reparation")
//            LazyVGrid(columns: columns, content: {
//                ForEach(vm.movieDetails!){ movie in
//                    AsyncImage(url: URL(string:"https://imgur.com/qPPIXcL.jpg")){image in
//                        image.image?.resizable()
//                            .scaledToFill()
//                    }
//
//                        HStack{
//                            Text("\(movie.fields.title)")
//                                .foregroundColor(.black)
//                        }
//                    }
//                })
            })
        }
//        .onAppear(){
//            Task{
//                await vm.fetchMovies()
//            }
//        }
    }
}

struct FavorisView_Previews: PreviewProvider {
    static var previews: some View {
        FavorisView()
            .environmentObject(MovieSearchViewModel(movies: []))
    }
}
