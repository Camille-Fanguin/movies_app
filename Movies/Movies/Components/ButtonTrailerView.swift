//
//  ButtonTrailerView.swift
//  Movies
//
//  Created by Marc on 22/06/2023.
//

import SwiftUI

struct ButtonTrailerView: View {
    private let label = "Watch Trailer"
    private let icon = "play.fill"
    private let gradientStart = Color("SunsetOrange")
    private let gradientEnd = Color("DarkMagenta")
    private let cornerRadius: CGFloat = 10
    
    var body: some View {
        Label(label, systemImage: icon)
            .padding()
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [gradientStart, gradientEnd]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(cornerRadius)
    }
}

struct ButtonTrailerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            ButtonTrailerView()
        }
    }
}
