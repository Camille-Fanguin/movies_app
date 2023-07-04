//
//  HistoryView.swift
//  Movies
//
//  Created by Apprenant 24 on 22/06/2023.


import SwiftUI

struct HistoryView: View {
    struct Film: Identifiable {
        let id = UUID()
        
        let filmPicture: String
    }
    var film1 = Film.init(filmPicture: "Baribie")

    var body: some View {
     
        ZStack{
            Color("Background").edgesIgnoringSafeArea(.all)
            ScrollView() {
              
                //recherche??
                    
                    HStack{
                        
                        Image("Barbie")
                            .resizable()
                            .frame(width: 95, height: 138, alignment: .center)
                            .clipShape(Rectangle()).cornerRadius(6)
                        Image("Avatar")
                            .resizable()
                            .frame(width: 95, height: 138, alignment: .center)
                            .clipShape(Rectangle()).cornerRadius(6)
                        Image("ExempleAffiche")
                            .resizable()
                            .frame(width: 95, height: 138, alignment: .center)
                            .clipShape(Rectangle()).cornerRadius(6)
                    }
                    .padding(30)
                    
                    Spacer()
                
                }
            .navigationTitle("")
                
                
                
                
            }
            
        }
        
        
    }
    



struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
