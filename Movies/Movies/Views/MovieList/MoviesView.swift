//
//  ListeFilms.swift
//  Movies
//
//  Created by Apprenant83 (Rémy D) on 22/06/2023.!!!!!!!
//
 
import SwiftUI

struct MoviesView: View {
    
    
    
    // @State var movieIndex2: Movie
    
    
    @State private var showingSheet = false // Pour faire apparaitre la modale
    @State var selectedMovieID: Int = 976573
    
    // @State private var movieSheet = Movie.self
    
    
    @EnvironmentObject var moviesVM : MoviesViewModel
    
    
    
    /////////////////////////////////////////////////////////////////
    var body: some View {
        
        
        NavigationView {
            
            ZStack{
                ///////////////// arrière-plan /////////
                
                Rectangle()
                    .foregroundColor(Color("Background"))
                    .ignoresSafeArea(.all)
                ///////////////////////////////////
                ///
                VStack{
                    
                    ScrollView { //vertical page entière
                        
                        
                        ////Affiche film à la une////////////////////////
                        HStack{
                            Text("A la une")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                                
                            Spacer()
                        }
                        
                        
                        HStack{
                            
                            
                            Button {
                                
                                selectedMovieID = 976573
                                
                                showingSheet.toggle()
                                
                                
                            } label: {
                                /* https://image.tmdb.org/t/p/original/aaGDsYYjltMxrwgs4qnHse4qlGX.jpg
                                 */
                                
                                
                                // "poster_path"
                                AsyncImage(url: URL(string:"https://image.tmdb.org/t/p/original/cSYLX73WskxCgvpN3MtRkYUSj1T.jpg")) {image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(15)
                                    //.frame(height: 200)
                                    //                                                .aspectRatio(contentMode: .fill)
                                    //
                                } placeholder: {
                                    Color.gray
                                }
                                //.frame(width: 400, height: 450)
                                
                                
                                
                                
                                
                                
                                
                                
                                //                                    Image(index.imageAffiche1)
                                //
                                //
                                //
                                //                                        .resizable()
                                //                                    //.frame(width: 390, height: 282)
                                //
                                //                                        .aspectRatio(contentMode: .fit)
                                
                            }//fin Label
                            
                            
                            /////////Modale plein écran
                            //                            .fullScreenCover(isPresented: $showingSheet){
                            //
                            //                                //MoviesModale(posterDetail:movieIndex1)
                            //                            }
                            
                            
                            //fin ForEach
                            
                        }
                        .padding(.bottom)//fin HStack
                        //.padding()
                        ///Affiches films actuellement/////////////
                        HStack{
                            
                            Text("Actuellement")
                                .foregroundColor(Color.white)
                                .font(.system(size: 24))
                                .padding(/*@START_MENU_TOKEN@*/.top, 0.0)
                            Spacer()
                        }//fin HStack
                        
                        //.padding(.leading, 11.0)
                        
                        ///////scrollview affiches actuellement////
                        ScrollView( .horizontal, showsIndicators: false) {
                            
                            HStack{
                                
                                ForEach(moviesVM.moviesNow.prefix(3)){ index in
                                    
                                    Button {
                                        
                                        selectedMovieID = index.id
                                        // movieIndex2=index
                                        
                                        showingSheet.toggle()
                                        //ContentView()
                                        
                                    } label: {
                                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(index.posterPath ?? "")")) //
                                        { image in
                                            image
                                                .resizable()
                                                .padding(.all, 2.0)
                                                //.frame(width: 152, height: 202)
                                                .frame(width: 115, height: 150)
                                                //.cornerRadius(15)
                                            
                                        } placeholder: {
                                            Color.gray
                                        }
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        //                                        Image(index.imageAffiche2)
                                        //                                            .resizable()
                                        //                                            .padding(/*@START_MENU_TOKEN@*/.all, 2.0/*@END_MENU_TOKEN@*/)
                                        //                                            .frame(width: 152, height: 202)
                                        //                                            .cornerRadius(15)
                                    }// fin Label
                                    
                                    
                                }
                                /* Avec la boucle Foreach, on evite de réécrire l'élément image qui est maintenant dans un tableau //////
                                 
                                 Image("Spiderman")
                                 .resizable()
                                 .frame(width: 152, height: 202)
                                 .cornerRadius(10)
                                 
                                 Image("Transformers")
                                 .resizable()
                                 .frame(width: 152, height: 202)
                                 .cornerRadius(10)
                                 
                                 Image("Guardians")
                                 .resizable()
                                 .frame(width: 152, height: 202)
                                 .cornerRadius(10)
                                 */////////////////////////////////////////////////////////////////////////////////////////////:
                                
                            }  //fin HStack
                            
                            
                        } //fin scrollview
                        
                                                
                        ///////////Films toujours à l'affiche/////
                        HStack{
                            Text("Toujours à l'affiche")
                                .foregroundColor(Color.white)
                                .font(.system(size: 24))
                                .padding(.top)
                            Spacer()
                        }//fin HStack
                       // .padding(.leading, 11.0)
                        
                        
                        ///////scrollview affiches toujours à l'affiche/////
                        ScrollView( .horizontal, showsIndicators: false) {
                            
                            HStack{
                                
                                ForEach(moviesVM.movies.suffix(3)){ index in
                                    
                                    Button {
                                        selectedMovieID = index.id
                                        
                                        showingSheet.toggle()
                                        //movieIndex3=index
                                        
                                        //showingSheet3.toggle()
                                        
                                    } label: {
                                        
                                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(index.posterPath ?? "")")) //
                                        { image in
                                            image
                                                .resizable()
                                                .padding(/*@START_MENU_TOKEN@*/.all, 2.0/*@END_MENU_TOKEN@*/)
                                                //.frame(width: 152, height: 202)
                                                .frame(width: 115, height: 150)
                                                .cornerRadius(15)
                                            
                                        } placeholder: {
                                            Color.gray
                                        }
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                    }
                                    
                                    
                                    //                                        Image(index.posterPath ?? "")
                                    //                                            .resizable()
                                    //                                            .padding(.all, 2.0)
                                    //                                            .frame(width: 152, height: 202)
                                    //                                            .cornerRadius(15)
                                }//fin Label
                            }
                        }
                        
                        
                        
                        
                        ////////////Films joués prochainement/////
                        HStack{
                            Text("Prochainement")
                                .foregroundColor(Color.white)
                                .font(.system(size: 24))
                                .padding(.top)
                            Spacer()
                        }//fin HStack
                       // .padding(.leading, 11.0)
                        
                        
                        ///////scrollview affiches films joués prochainement/////
                        ///
                        ScrollView( .horizontal, showsIndicators: false) {
                            
                            HStack{
                                
                                ForEach(moviesVM.moviesUp.suffix(3)){ index in
                                    Button {
                                        selectedMovieID = index.id
                                        
                                        showingSheet.toggle()
                                        
                                        //movieIndex4=index
                                        
                                        //showingSheet4.toggle()
                                        
                                    } label: {
                                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(index.posterPath ?? "")")) //
                                        { image in
                                            image
                                                .resizable()
                                                .padding(/*@START_MENU_TOKEN@*/.all, 2.0/*@END_MENU_TOKEN@*/)
                                               // .frame(width: 152, height: 202)
                                                .frame(width: 115, height: 150)
                                                .cornerRadius(15)
                                            
                                        } placeholder: {
                                            Color.gray
                                        }
                                        
                                        
                                        //                                        Image(index.posterPath ?? "")
                                        //                                            .resizable()
                                        //                                            .padding(/*@START_MENU_TOKEN@*/.all, 2.0/*@END_MENU_TOKEN@*/)
                                        //                                            .frame(width: 152, height: 202)
                                        //                                            .cornerRadius(15)
                                        
                                    }
                                    
                                    ///////////// view MovieDetailsView/////////////////////
                                    .sheet(isPresented: $showingSheet) {
                                        MovieDetailsView(movieID: $selectedMovieID)
                                    }
                                    
                                    
                                    //                                    .fullScreenCover(isPresented: $showingSheet4){
                                    //                                       // ContentView()
                                    //
                                    //                                        //MoviesModale4(posterDetail4:movieIndex4)
                                    //                                    }
                                    
                                }//fin boucle ForEach
                            }// fin HStack
                        }// fin scrollview
                        
                        Spacer()
                    }//fin scrollview vertical
                }//fin ZStack
            }
        }
        .task{
            await moviesVM.getPopularMovies() //tableau movies
            await moviesVM.getUpMovies()
            await moviesVM.getNowMovies()
        }
        .refreshable {
            Task {
                await moviesVM.getPopularMovies() //tableau movies
                await moviesVM.getUpMovies()
                await moviesVM.getNowMovies()
            }
        }
    }
}

struct imageSearch: Codable {
    var poster_path: String;
    
}

struct imageSearchActu: Codable {
    var poster_path2: [String];
    
}







struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
            .environmentObject(MoviesViewModel())
    }
}


//struct AfficheUneTrack: Identifiable {
//    //Je fais une variable UUID() pour avoir un identifiant unique dans l'image a la une
//
//    var id = UUID()
//    var imageAfficheUne: String
//
//}

//struct AfficheTrack2: Identifiable {
//    //Je fais une variable UUID() pour avoir un identifiant unique dans ma liste de films joués actuellement
//
//    var id = UUID()
//    var imageAffiche2: String
//
//}
//
//struct AfficheTrack3: Identifiable {
//    //Je fais une variable UUID() pour avoir un identifiant unique dans ma liste de films toujours à l'affiche
//
//    var id = UUID()
//    var imageAffiche3: String
//
//}
//
//struct AfficheTrack4: Identifiable {
//    //Je fais une variable UUID() pour avoir un identifiant unique dans ma liste de films joués prochainement
//
//    var id = UUID()
//    var imageAffiche4: String
//
//}
