//
//  ClassView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/15.
//

//this can expand the Observable Macro
//import Observation

import SwiftUI

extension ClassView {
    @Observable
    class User{
        var firstName = "bright"
        var lastName = "bob"
    }
}

struct ClassView: View {
    @State private var user = User()
    
    var body: some View {
        VStack{
            Text("your name is \(user.firstName) \(user.lastName)")
            TextField("first name", text: $user.firstName)
            TextField("last name", text: $user.lastName)
        }
        .padding()
    }
}

#Preview {
    ClassView()
}
