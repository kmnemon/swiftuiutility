//
//  AlertOptionalView.swift
//  swiftuiutility
//
//  Created by ke on 4/9/24.
//

import SwiftUI

extension AlertOptionalModifier {
    struct User: Identifiable {
        var id = "ke"
    }
}

struct AlertOptionalModifier: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        Button("Tap Me") {
            selectedUser = User()
            isShowingUser = true
        }
        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
            Button(user.id) {} 
        }
    }
}

#Preview {
    AlertOptionalModifier()
}
