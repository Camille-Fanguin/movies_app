//
//  TestEditProfile.swift
//  Movies
//
//  Created by Cam on 22/06/2023.
//

import SwiftUI

struct TestEditProfile: View {
    @Binding var username: String
    var body: some View {
        VStack {
            Text("It's working!")
                .font(.title)
                .bold()
            Text("Pseudo: \(username)")
                .font(.title2)
        }
    }
}

struct TestEditProfile_Previews: PreviewProvider {
    static var previews: some View {
        TestEditProfile(username: .constant("Test"))
    }
}
