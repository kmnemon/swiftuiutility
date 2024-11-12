//
//  PresentationDetents.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/12.
//
import SwiftUI

extension PresentationDetentsModifier {
    struct User: Identifiable {
        var id = "ke"
    }
}

struct PresentationDetentsModifier: View {
    @State private var selectedUser: User?
    
    var body: some View {
        Button("Tap Me") {
            let user = User()
        }
        .sheet(item: $selectedUser) { user in
            Text(user.id)
                .presentationDetents([.medium, .large])
        }
    }
}
