

import SwiftUI

struct PreferedGenreCellView: View {
    @State var showChart : Bool = false
    @ObservedObject var movieStat: MovieStatsVM

    var genreName : String
    var body: some View {
        
        
        Button {
            showChart = true
        } label: {
            ZStack{   Rectangle()
                    .frame(width: 158, height: 123)
                    .foregroundColor(Color("GrayBackground")).cornerRadius(6)
                    .padding()
                VStack(alignment: .center) {
                    Text("Genre préféré").font(.custom("Poppins", size: 20)).fontWeight(.medium).foregroundColor(.white)
                        .frame(alignment: .topLeading)
                        .padding()
                    
                    Text(genreName).font(.custom("SF", size: 26)).fontWeight(.regular).foregroundColor(.white).frame(alignment: .topLeading)
                }
            }
            
            
            NavigationLink(destination:PreferedGenreDetailView(movieStat: movieStat),isActive: $showChart){EmptyView()}
            
        }
        
        .padding()
        
        
    }
}


struct PreferedGenreCelliew_Previews: PreviewProvider {
    static var previews: some View {
        PreferedGenreCellView(movieStat: MovieStatsVM(), genreName: "SF")
    }
}
