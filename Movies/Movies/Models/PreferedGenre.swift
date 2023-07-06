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
let sf = Genre(id: 380, name:"Science-Fiction")
let drama = Genre(id: 689, name:"Drama")
let aventure = Genre(id: 600, name:"Aventure")
let Crime = Genre(id: 300, name:"Crime")
let Thriller = Genre(id: 689, name:"Thriller")
let Animation = Genre(id: 689, name:"Animation")
let Mystère = Genre(id: 689, name:"Mystère")
let Familial = Genre(id: 689, name:"Familial")
let Romance = Genre(id: 689, name:"Romance")
let Comédie = Genre(id: 689, name:"Comédie")


