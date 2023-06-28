//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Apprenant83 (Rémy D) on 26/06/2023.
//

import SwiftUI

class FilmsViewModel: ObservableObject {
    
    @Published var imageUne = [AfficheUneTrack(imageAfficheUne: "GuardiansL")]
    
    @Published var afficheTab2 = [
        AfficheTrack2(imageAffiche2: "TheFlash"),
        AfficheTrack2(imageAffiche2: "Spiderman"),
        AfficheTrack2(imageAffiche2: "Transformers"),
        AfficheTrack2(imageAffiche2: "Guardians")
    ]
    
    @Published var afficheTab3 = [
        AfficheTrack3(imageAffiche3: "JohnWick4"),
        AfficheTrack3(imageAffiche3: "SuperMario"),
        AfficheTrack3(imageAffiche3: "Avatar"),
        AfficheTrack3(imageAffiche3: "Contre-Sens"),
        AfficheTrack3(imageAffiche3: "Mousquetaires")

    ]
    
    @Published var afficheTab4 = [
        AfficheTrack4(imageAffiche4: "Expendables4"),
        AfficheTrack4(imageAffiche4: "Oppenheimer"),
        AfficheTrack4(imageAffiche4: "Tokyo"),
        AfficheTrack4(imageAffiche4: "Barbie"),
        AfficheTrack4(imageAffiche4: "EauxTroubles")

    ]
    
    
}
