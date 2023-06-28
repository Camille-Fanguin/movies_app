//
//  HistoryView.swift
//  Movies
//
//  Created by Djihane

import SwiftUI

struct ProfileView: View {
    
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
                        Button {
                            //
                        } label: {
                            Image(systemName:"gearshape").foregroundColor(.gray)
                                .frame(alignment: .topLeading)
                                .font(.system(size:20))
                            .offset(x:-26, y:16)}
                        
                        
                    }
                    ProfileInfoView(ProfileName: "Jane Doe", ProfilePicture: "ProfilePicture")
                    
                    NavigationLink {
                        EditProfileView()
                    } label: {
                        Text("Modifier")
                            .font(.custom("Poppins-regular", size: 15))
                            .foregroundColor(Color("Background"))
                            .padding()
                            .background(Color("UnselectedColor"))
                            .cornerRadius(40)
                            .padding()
                            .frame(alignment: .center)
                    }
                    ZStack{
                        ProfileCompartimentsView(ProfileSection: "Déjà vus")}
                    ZStack{
                        
                        VStack{
                            HStack{
                                Text("Top 3").foregroundColor(Color("Gray")).font(.custom("Poppins", size: 20))
                                    .fontWeight(.semibold)
                                    .frame(width: 342, alignment: .topLeading)
                                
                            }
                            
                            HStack{
                                
                                Image("ExempleAffiche")
                                    .resizable()
                                    .frame(width: 95, height: 138, alignment: .center)
                                    .clipShape(Rectangle()).cornerRadius(6)
                                Image("ExempleAffiche")
                                    .resizable()
                                    .frame(width: 95, height: 138, alignment: .center)
                                    .clipShape(Rectangle()).cornerRadius(6)
                                Image("ExempleAffiche")
                                    .resizable()
                                    .frame(width: 95, height: 138, alignment: .center)
                                    .clipShape(Rectangle()).cornerRadius(6)
                            }
                            
                            .padding()
                            .background(Color("GrayBackground")).cornerRadius(6)
                            
                        }
                    }
                    ScrollView(.horizontal) {
                        HStack{
                            
                            PreferedStatCellView(TitleOfStats: "Temps", StatsDispayed: "18 heures")
                            
                            PreferedGenreCellView()
                            
                            PreferedStatCellView(TitleOfStats: "Films vus", StatsDispayed: "6")}
                    }
                }//scroll
                
            } //fin vstack
            
            .background(Color("Background"))
        }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProfileView()
    }
}




struct ProfileCompartimentsView: View {
    
    let ProfileSection: String
    // let MoviePoster: String
    @State var showView: Bool = false
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Button {
                        showView = true
                    } label: {
                        Text(ProfileSection).foregroundColor(Color("Gray")).font(.custom("Poppins", size: 20))
                            .fontWeight(.semibold)
                        
                        Image(systemName: "chevron.forward")
                            .foregroundColor(Color("Gray"))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    NavigationLink(destination:HistoryView(),isActive: $showView){EmptyView()}
                    
                }
                .padding(.horizontal,30)
            }
            HStack{
                
                Image("ExempleAffiche")
                    .resizable()
                    .frame(width: 95, height: 138, alignment: .center)
                    .clipShape(Rectangle()).cornerRadius(6)
                Image("ExempleAffiche")
                    .resizable()
                    .frame(width: 95, height: 138, alignment: .center)
                    .clipShape(Rectangle()).cornerRadius(6)
                Image("ExempleAffiche")
                    .resizable()
                    .frame(width: 95, height: 138, alignment: .center)
                    .clipShape(Rectangle()).cornerRadius(6)
            }
            .padding()
            .background(Color("GrayBackground")).cornerRadius(6)
            
            
        }
        .navigationTitle("Profil")
    }
    
}

struct ProfileInfoView: View {
    let ProfileName: String
    let ProfilePicture: String
    
    var body: some View {
        VStack{
            Text(ProfileName)
                .font(.custom("Poppins-semibold", size: 20)).foregroundColor(.white)
                .padding()
            
            Image(ProfilePicture)
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
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
                .foregroundColor(Color("GrayBackground")).cornerRadius(6)
                .padding()
            VStack(alignment: .center) {
                Text(TitleOfStats).font(.custom("Poppins", size: 16)).fontWeight(.bold).foregroundColor(.white)
                    .padding().frame(alignment: .topLeading)
                Text(StatsDispayed).font(.custom("SF", size: 16)).fontWeight(.regular).foregroundColor(.white).frame(alignment: .topLeading)
            }
            
            
        }
        .padding()
    }
}
