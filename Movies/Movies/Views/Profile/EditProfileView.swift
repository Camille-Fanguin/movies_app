//
//  EditProfile.swift
//  Movies
//
//  Created by Cam on 22/06/2023.
//

import SwiftUI

struct EditProfileView: View {
    @State var ProfileName: String
    @State var date = Date()
    @State var showPhotoPicker = false
    @State var selectedImage: UIImage?
    
    var body: some View {
        NavigationStack {
            ZStack {
                CustomColor.background
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .opacity(0)
                        
                        Spacer()
                        
                        Text("Modifier")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title2)
                        
                        Spacer()
                        
                        NavigationLink {
                            ProfileView(ProfileName: $ProfileName, selectedImage: $selectedImage)
                            
                            
                        } label: {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.green)
                        }
                        .tag(Screen.profile)
                    }
                    .padding()
                    
                    Button(action: { showPhotoPicker = true }) {
                        ZStack {
                            if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(100)
                            }
                            
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
                    }
                    .fullScreenCover(isPresented: $showPhotoPicker) {
                        PhotoPicker(filter: .images, limit: 1) { results in
                            PhotoPicker.convertToUIImageArray(fromResults: results) { imagesOrNil, errorOrNil in
                                if let error = errorOrNil {
                                    print(error)
                                }
                                if let images = imagesOrNil {
                                    if let first = images.first {
                                        selectedImage = first
                                    }
                                }
                            }
                        }
                        .edgesIgnoringSafeArea(.all)
                    }
                    .padding(.bottom)
                    
                    Text("Pseudo")
                        .foregroundColor(.white)
                        .bold()
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.gray)
                            .frame(width: 270, height: 50)
                        HStack {
                            Image(systemName: "applepencil")
                                .foregroundColor(.white)
                                .font(.title2)
                            TextField("\(ProfileName)", text: $ProfileName)
                                .textContentType(.givenName)
                                .border(.gray)
                                .frame(width: 200, height: 20)
                                .foregroundColor(.white)
                                .accentColor(.red)
                        }
                    }
                    .padding(.bottom)
                    
                    VStack {
                        Text("Date de naissance")
                            .bold()
                            .foregroundColor(.white)
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
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
                    Spacer()
                }
            }
        
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(ProfileName: "Jane Doe", selectedImage: UIImage(named: "ProfilePicture")!)
    }
}

struct CustomColor {
    static let background = Color("Background")
}
