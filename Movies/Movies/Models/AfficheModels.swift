//
//  AfficheModels.swift
//  Movies
//
//  Created by Apprenant83(RemyD) on 26/06/2023.
//

import Foundation

struct AfficheTrack1: Identifiable {
    //Je fais une variable UUID() pour avoir un identifiant unique dans l'image a la une
   
    var id = UUID()
    var imageAffiche1: String

}
struct AfficheTrack2: Identifiable {
    //Je fais une variable UUID() pour avoir un identifiant unique dans ma liste de films joués actuellement
   
    var id = UUID()
    var imageAffiche2: String

}

struct AfficheTrack3: Identifiable {
    //Je fais une variable UUID() pour avoir un identifiant unique dans ma liste de films toujours à l'affiche
   
    var id = UUID()
    var imageAffiche3: String

}

struct AfficheTrack4: Identifiable {
    //Je fais une variable UUID() pour avoir un identifiant unique dans ma liste de films joués prochainement
   
    var id = UUID()
    var imageAffiche4: String

}
