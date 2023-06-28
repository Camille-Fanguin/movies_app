//
//  HistoryView.swift
//  Movies
//
//  Created by Djihane on 22/06/2023.


import SwiftUI

struct HistoryView: View {
    var body: some View {
        
        ZStack{
            
            Color("Background")
                .edgesIgnoringSafeArea(.all)
           
                VStack{
                   
                    Image("ExempleAffiche")
                        .resizable()
                        .frame(width: 95, height: 138, alignment: .center)
                        .clipShape(Rectangle()).cornerRadius(6)
            }
        }
    }
}


struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
