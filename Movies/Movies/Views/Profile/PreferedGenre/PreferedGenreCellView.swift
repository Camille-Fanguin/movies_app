

import SwiftUI

struct PreferedGenreCellView: View {
//    @State var showChart : Bool = false
//    @EnvironmentObject var movieStat: MovieStatsVM

    var genreName : String
    var body: some View {
        
        
        NavigationLink {
            PreferedGenreDetailView()
        } label: {
            ZStack{   Rectangle()
                    .frame(width: 158, height: 123)
                    .foregroundColor(Color("DarkMagenta2")).cornerRadius(6)
                    .padding()
                VStack(alignment: .center) {
                    Text("Genre préféré").font(.custom("Poppins", size: 20)).fontWeight(.medium).foregroundColor(.white)
                        .frame(alignment: .topLeading)
                        .padding()
                    
                    Text(genreName).font(.custom("SF", size: 26)).fontWeight(.regular).foregroundColor(.white).frame(alignment: .topLeading)
                }
            }
        }
        
        .padding()
        
        
    }
}


struct PreferedGenreCelliew_Previews: PreviewProvider {
    static var previews: some View {
        PreferedGenreCellView(genreName: "SF").environmentObject(MovieStatsVM())
    }
}
