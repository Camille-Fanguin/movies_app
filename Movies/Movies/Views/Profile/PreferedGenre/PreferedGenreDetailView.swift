//
//  HistoryView.swift
//  Movies
//
//  Created by Djihane

import SwiftUI
import Charts

struct PreferedGenreDetailView: View {
    @EnvironmentObject var movieStat: MovieStatsVM

    var body: some View {
        ZStack{
            
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all).opacity(0.0)
            Chart {
                ForEach(movieStat.data) { statChart in
                    BarMark(
                        x: .value("Genre", statChart.Genre.name),
                        y: .value("Number of Movies", Double(statChart.NumberOfMovies))
                    )
                    // .foregroundStyle(Gradient(colors: [.red,.purple]))
                    .foregroundStyle(Gradient(colors: [Color("DarkMagenta"), Color("SunsetOrange")]))
                }
            }
            .frame(width: 300,height:300, alignment: .center)
            
            
        }
    }
}



struct PreferedGenreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PreferedGenreDetailView().environmentObject(MovieStatsVM())
    }
}


