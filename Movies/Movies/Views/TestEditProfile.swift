//
//  TestEditProfile.swift
//  Movies
//
//  Created by Apprenant17 on 22/06/2023.
//

import SwiftUI

struct TestEditProfile: View {
    @Binding var username: String
    var body: some View {
        Text("It's working!")
            .font(.title)
        Text("\(username)")
            .font(.title2)
    }
}

struct TestEditProfile_Previews: PreviewProvider {
    static var previews: some View {
        TestEditProfile(username: .constant("Test"))
    }
}
