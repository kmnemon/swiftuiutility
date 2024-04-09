//
//  SheetOptionalView.swift
//  swiftuiutility
//
//  Created by ke on 4/9/24.
//

import SwiftUI


struct SheetOptionalModifier: View {
    @State private var selectedUser: AlertOptionalModifier.User? = nil
    
    var body: some View {
        Button("Tap Me") {
            selectedUser = AlertOptionalModifier.User()
        }
        .sheet(item: $selectedUser) { user in
            Text(user.id)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    SheetOptionalModifier()
}
