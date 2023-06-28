//
//  MoviesView.swift
//  Movies
//
//  Created by Marc on 27/06/2023.
//

import SwiftUI

struct MoviesView: View {
    @StateObject var vm = MoviesViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
