//
//  ListeFilms.swift
//  Movies
//
//  Created by Apprenant83 (Rémy D) on 22/06/2023.
//

import SwiftUI

struct ListeFilmsView: View {
    @State private var showingSheet = false // Pour faire apparaitre la modale
    @EnvironmentObject var moviesVM : FilmsViewModel
    
  /*//////////// essai avec un tableau simple pour la boucle for
   
    let afficheTab=["TheFlash","Spiderman", "Transformers","Guardians"]
    
   /////////////////////////////////////////////// */
  
    ///     affiche à la une
//    let imageUne = AfficheUneTrack(imageAfficheUne: "GuardiansL")
   ////////////////////////////
    ///
    ////Affiches pour les films  joués actuellement
//    var afficheTab2 = [
//        AfficheTrack2(imageAffiche2: "TheFlash"),
//        AfficheTrack2(imageAffiche2: "Spiderman"),
//        AfficheTrack2(imageAffiche2: "Transformers"),
//        AfficheTrack2(imageAffiche2: "Guardians")
//
//    ]
    ///////////////////
    /////Affiches pour les films toujours à l'affiche
    
//    var afficheTab3 = [
//        AfficheTrack3(imageAffiche3: "JohnWick4"),
//        AfficheTrack3(imageAffiche3: "SuperMario"),
//        AfficheTrack3(imageAffiche3: "Avatar"),
//        AfficheTrack3(imageAffiche3: "Contre-Sens"),
//        AfficheTrack3(imageAffiche3: "Mousquetaires")
//
//    ]
   ///////////////////////////:
    ///Affiches pour les filmls joués prochainement
    ///
//    var afficheTab4 = [
//        AfficheTrack4(imageAffiche4: "Expendables4"),
//        AfficheTrack4(imageAffiche4: "Oppenheimer"),
//        AfficheTrack4(imageAffiche4: "Tokyo"),
//        AfficheTrack4(imageAffiche4: "Barbie"),
//        AfficheTrack4(imageAffiche4: "EauxTroubles")
//
//    ]
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
                        .padding(.leading, 11.0)
                        
                        HStack{
                            ForEach(moviesVM.imageUne){ index in
                                
                                Button {
                                    showingSheet.toggle()
                                    
                                      
                                }
                            
                            
                            
                            
                            label: {
                                    
                                    Image(index.imageAfficheUne)
                                    
                                    
                                    
                                        .resizable()
                                    //.frame(width: 390, height: 282)
                                    
                                        .aspectRatio(contentMode: .fit)
                                }//fin Label
                                
                        ///////////// Modale///////////////////////////
//                            .sheet(isPresented: $showingSheet) {
//                                ContentView()//View pour tester la modale
//                                }
                                
            /////////Modale plein écran//////////////////////////////////////////////////
                            .fullScreenCover(isPresented: $showingSheet){
                                MovieDetailsView()
                            }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////
                       
                            }//fin ForEach
                            
                        }//fin HStack
                        
                        ///Affiches films actuellement/////////////
                        HStack{
                            Text("Actuellement")
                                .foregroundColor(Color.white)
                                .font(.system(size: 24))
                            Spacer()
                        }//fin HStack
                        
                        .padding(.leading, 11.0)
                        
                       ///////scrollview affiches actuellement////
                        ScrollView( .horizontal, showsIndicators: false) {
                            
                            HStack{
                                
                                ForEach(moviesVM.afficheTab2){ index in
                                    
                                    Button {
                                        MovieDetailsView()
                                    } label: {
                                        Image(index.imageAffiche2)
                                            .resizable()
                                            .padding(/*@START_MENU_TOKEN@*/.all, 2.0/*@END_MENU_TOKEN@*/)
                                            .frame(width: 152, height: 202)
                                            .cornerRadius(15)
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
                            Spacer()
                        }//fin HStack
                        .padding(.leading, 11.0)
                        
                        
                    ///////scrollview affiches toujours à l'affiche/////
                        ScrollView( .horizontal, showsIndicators: false) {
                            
                            HStack{
                                
                                ForEach(moviesVM.afficheTab3){ index in
                                    
                                    Button {
                                        
                                    } label: {
                                        Image(index.imageAffiche3)
                                            .resizable()
                                            .padding(.all, 2.0)
                                            .frame(width: 152, height: 202)
                                            .cornerRadius(15)
                                    }//fin Label
                                }
                            }// fin HStack
                            
                            
                        }// fin scrollview
                        
                        
                        ////////////Films joués prochainement/////
                        HStack{
                            Text("Prochainement")
                                .foregroundColor(Color.white)
                                .font(.system(size: 24))
                            Spacer()
                        }//fin HStack
                        .padding(.leading, 11.0)
                        
                        
                        ///////scrollview affiches films joués prochainement/////
                        ///
                        ScrollView( .horizontal, showsIndicators: false) {
                            
                            HStack{
                                
                                ForEach(moviesVM.afficheTab4){ index in
                                    Button {
                                            
                                    } label: {
                                        Image(index.imageAffiche4)
                                            .resizable()
                                            .padding(/*@START_MENU_TOKEN@*/.all, 2.0/*@END_MENU_TOKEN@*/)
                                            .frame(width: 152, height: 202)
                                            .cornerRadius(15)
                                        
                                    }
                                }//fin boucle ForEach
                            }// fin HStack
                            
                            
                        }// fin scrollview
                        
                        
                        
                        
                        
                        Spacer()
                        
                        
                    }//fin scrollview vertical
                }// fin VStack
            }//fin ZStack
        }//fin navigation view
    }
}

struct ListeFilmsView_Previews: PreviewProvider {
    static var previews: some View {
        ListeFilmsView()
            .environmentObject(FilmsViewModel())
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

