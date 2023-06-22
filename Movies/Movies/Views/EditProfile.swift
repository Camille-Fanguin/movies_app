//
//  EditProfile.swift
//  Movies
//
//  Created by Apprenant17 on 22/06/2023.
//

import SwiftUI

struct EditProfile: View {
    @State var username: String = "Jane Doe"
    @State var date = Date()
    var body: some View {
        NavigationStack {
            ZStack {
                CustomColor.background
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        NavigationLink {
                            TestEditProfile(username: $username) // A remplacer soit par un retour à la page Profil, soit à enlever pour laisser le bouton Back de base
                        } label: {
                            Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        Text("Modifier")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title2)
                        
                        Spacer()
                        
                        NavigationLink {
                            TestEditProfile(username: $username) // A remplacer par un retour à la page Profil
                        } label: {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.green)
                        }
                    }
                    .padding()
                    
                    NavigationLink {
                        TestEditProfile(username: $username) // A remplacer par un accès à la galerie de l'Iphone
                    } label: {
                        ZStack {
                            Image("ProfilePic")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .cornerRadius(100)
                            
                            Circle()
                                .fill(.black)
                                .frame(width: 150, height: 150)
                                .opacity(0.5)
                            
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .opacity(0.5)
                        }
                        .padding()
                    }
                    
                    VStack {
                        Text("Pseudo")
                            .foregroundColor(.white)
                            .bold()
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray)
                                .frame(width: 270, height: 50)
                            HStack {
                                Image(systemName: "applepencil")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                TextField("\(username)", text: $username)
                                    .textContentType(.givenName)
                                    .border(.gray)
                                    .frame(width: 200, height: 20)
                                    .foregroundColor(.white)
                                    .accentColor(.red)
                                    
                            }
                        }
                    }
                    .padding()
                    
                    VStack {
                        Text("Date de naissance")
                            .bold()
                            .foregroundColor(.white)
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray)
                                .frame(width: 270, height: 50)
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .padding(.leading)
                                DatePicker(selection: $date, displayedComponents: .date) {
                                }
                                .datePickerStyle(.compact)
                                .accentColor(.red)
                                .offset(x: -55)
                                .labelsHidden()
                                .frame(width: 220, height: 20)
                            }
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
        }
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}

struct CustomColor {
    static let background = Color("Background")
}
