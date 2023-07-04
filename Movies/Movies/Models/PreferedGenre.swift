//
//  PreferedGenre.swift
//  Movies
//
//  Created by Djihane on 27/06/2023.
//

import Foundation
import Charts
struct StatCharts: Identifiable{
    var id = UUID()
    var Genre: Genre
    var NumberOfMovies: Int
}
let action = Genre(id: 0123, name:"Action")
let sf = Genre(id: 380, name:"SF")
let drama = Genre(id: 689, name:"Drama")
