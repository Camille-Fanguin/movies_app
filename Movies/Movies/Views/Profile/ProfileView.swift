//
//  HistoryView.swift
//  Movies
//
//  Created by Djihane

import SwiftUI

struct ProfileView: View {
    
    @Binding var ProfileName: String
    @Binding var selectedImage: UIImage?
    
    @State var showModifier: Bool = false
    @EnvironmentObject var movieStat: MovieStatsVM
    @ObservedObject var viewdMovies = ViewdMovies()
    
    
    
    var body: some View {
        NavigationStack{
            ScrollView() {
                Color("Background")
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Color("Background")
                        .edgesIgnoringSafeArea(.all)
                    HStack{
Spacer()
                        NavigationLink {
                            EditProfileView(ProfileName: "Jane Doe")
                        } label: {
                            Text("Modifier")
                                .font(.custom("Poppins-regular", size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                            .background(Color("DarkMagenta2"))
                                .cornerRadius(40)
                                .padding()
                                .frame(alignment: .topTrailing)
                        }
                     
                        
                    }
                    ProfileInfoView(selectedImage: $selectedImage, ProfileName: $ProfileName)
                    
                   
                   
                        ProfileCompartimentsView(ProfileSection: "Déjà vus")
                    ZStack{
                        
                        VStack{
                            HStack {
                                Text("Top 3").foregroundColor(.white).font(.custom("Poppins", size: 20))
                                    .fontWeight(.semibold)
                                    .frame(width: 342, alignment: .topLeading)
                                
                            }
                            
                            HStack{
                                
                                Image("ExempleAffiche")
                                    .resizable()
                                    .frame(width: 115, height: 150, alignment: .center)
                                    .clipShape(Rectangle()).cornerRadius(6)
                                Image("Avatar")
                                    .resizable()
                                    .frame(width: 115, height: 150, alignment: .center)
                                    .clipShape(Rectangle()).cornerRadius(6)
                                
                               
                             
                            }
                            
                            .padding()
                            
                        }
                    }
                    ScrollView(.horizontal) {
                        HStack{
                            let (totalTime, moviesNumber, favGenre) = movieStat.calculateStatsMovies()
                            let (hours, minutes) = minutesToHours(minutes: totalTime)
                            PreferedStatCellView(TitleOfStats: "Temps", StatsDispayed: "\(hours)h\(minutes)")
                            
                            PreferedGenreCellView( genreName:favGenre)
                            
                            PreferedStatCellView(TitleOfStats: "Films vus", StatsDispayed: "\(moviesNumber)")}
                        .padding(.horizontal)
                    }
                }//scroll
                
            } //fin vstack
            
            .background(Color("Background"))
        }
      
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(ProfileName: .constant("Jane Doe"), selectedImage: .constant(UIImage(named: "ProfilePicture")!)).environmentObject(ViewdMovies()).environmentObject(MovieStatsVM())
    }
}




struct ProfileCompartimentsView: View {
    
    let ProfileSection: String
    @State var showView: Bool = false
    @EnvironmentObject var movieStat: MovieStatsVM
    private let imageBaseUrl = "https://image.tmdb.org/t/p/original"
    var body: some View {
        

                HStack{
                    NavigationLink {
                        HistoryView()
                    } label: {
                        Text(ProfileSection).foregroundColor(.white).font(.custom("Poppins", size: 20))
                            .fontWeight(.semibold)
                       Image(systemName: "chevron.forward")
                            .foregroundColor(Color("Gray"))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    

                .padding(.horizontal,30)
            }
            HStack{
                if movieStat.movies.isEmpty{
                   
                    
                    Rectangle().foregroundColor(.gray)
                        .opacity(0)
                        .frame(width: 115, height: 150)
                        .cornerRadius(6)
                        .padding(5)
                  
                    
                    

                } else {
                    ForEach(movieStat.movies.suffix(3)) { movie in
                        VStack {
                            if let backdropPath = movie.backdropPath {
                                
                                let imageUrl = imageBaseUrl + backdropPath
                                
                                AsyncImage(url: URL(string: imageUrl)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    //Text(movie.title ?? "")
                                    // .font(.caption)
                                } placeholder: {
                                    
                                    Rectangle().foregroundColor(.gray)
                                }
                            }
                            
                            
                        }
                        .frame(width: 115, height: 150)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(6)
                        .padding(5)
                    }}
            
                
                }
                    
            
            .padding()
            
            
        
                
    }
    
}

struct ProfileInfoView: View {
    @Binding var selectedImage: UIImage?
    var defaulting = UIImage(named: "ProfilePicture")!
    @Binding var ProfileName: String
    
    var body: some View {
        VStack{
            Image(uiImage: selectedImage ?? defaulting)
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            Text(ProfileName)
                .font(.custom("Poppins-semibold", size: 20)).foregroundColor(.white)
                .padding()
            
            
        }
    }
}




struct PreferedStatCellView: View {
    
    let TitleOfStats: String
    let StatsDispayed: String
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width: 158, height: 123)
                .foregroundColor(Color("DarkMagenta2")).cornerRadius(6)
            VStack(alignment: .center) {
                Text(TitleOfStats).font(.custom("Poppins", size: 20)).fontWeight(.bold).foregroundColor(.white)
                    .padding().frame(alignment: .topLeading)
                Text(StatsDispayed).font(.custom("SF", size: 22)).fontWeight(.regular).foregroundColor(.white).frame(alignment: .topLeading)
            }
            
            
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Profil")
            
        }
    }
}
