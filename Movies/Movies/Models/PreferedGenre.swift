//
//  PreferedGenre.swift
//  Movies
//
//  Created by Djihane on 27/06/2023.
//

import Foundation
struct StatCharts: Identifiable{
    let id = UUID()
    var Genre: String
    var NumberOfMovies: Int
}
var data:[StatCharts] = [
    .init(Genre: "Action", NumberOfMovies: 6),
    .init(Genre: "Drama", NumberOfMovies: 4)
    //ajouter les valeur plus tard, ici des fake stats
]
