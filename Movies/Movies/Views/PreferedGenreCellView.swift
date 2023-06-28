//
//  HistoryView.swift
//  Movies
//
//  Created by Djihane

import SwiftUI

struct PreferedGenreCellView: View {
    var body: some View {
        ZStack{
            
            Rectangle()
                .frame(width: 158, height: 123)
                .foregroundColor(Color("GrayBackground")).cornerRadius(6)
                .padding()
            VStack(alignment: .center) {
                Text("Genre préféré").font(.custom("Poppins", size: 16)).fontWeight(.medium).foregroundColor(.white)
                    .frame(alignment: .topLeading)
                    .padding()
                Button {
                    //
                } label: {
                    Text("Action").font(.custom("SF", size: 16)).fontWeight(.regular).foregroundColor(.white).frame(alignment: .topLeading)
                }
                
            }
        }
        .padding()
        
        
    }
}


struct PreferedGenreCellView_Previews: PreviewProvider {
    static var previews: some View {
        PreferedGenreCellView()
    }
}
