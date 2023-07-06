import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var movieStat: MovieStatsVM
    private let imageBaseUrl = "https://image.tmdb.org/t/p/original"

    var body: some View {
        
        
            ZStack{
                Color("Background").edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 20) {
                        ForEach(movieStat.movies) { movie in
                            VStack {
                                if let backdropPath = movie.backdropPath {
                                    
                                    let imageUrl = imageBaseUrl + backdropPath
                                    
                                    AsyncImage(url: URL(string: imageUrl)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                        //Text(movie.title ?? "")
                                            .font(.caption)
                                    } placeholder: {
                                        Rectangle().foregroundColor(.gray)
                                    }
                                } else {
                                    Rectangle().foregroundColor(.gray)
                                }
                            }
                            .frame(width: 95, height: 138)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(6)
                            .padding(5)
                        }
                    }
                    .padding(10)
                }
            }
            .navigationTitle("Vus")
        
    }
}


struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environmentObject(MovieStatsVM())
    }
}

