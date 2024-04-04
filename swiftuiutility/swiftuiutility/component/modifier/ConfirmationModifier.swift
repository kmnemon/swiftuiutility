//
//  ConfirmationModifier.swift
//  swiftuiutility
//
//  Created by ke on 4/4/24.
//

import SwiftUI

struct ConfirmationModifier: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Button("Hello, world!") {
            showingConfirmation.toggle()
        }
        .frame(width: 300, height: 300)
        .background(backgroundColor)
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Red") { backgroundColor = .red }
            Button("Green") { backgroundColor = .green }
            Button("Blue") { backgroundColor = .blue }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Select a new color.")
        }
        
    }
}

#Preview {
    ConfirmationModifier()
}
