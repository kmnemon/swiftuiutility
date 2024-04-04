//
//  ContentUnavailableView.swift
//  swiftuiutility
//
//  Created by ke on 4/4/24.
//

import SwiftUI

struct UnavailableView: View {
    var body: some View {
        VStack {
            ContentUnavailableView("No snippets", systemImage: "swift", description: Text("you don't have any saved snippets yet"))
            
            ContentUnavailableView {
                Label("No snippets", systemImage: "swift")
            } description: {
                Text("you don't have any saved snippets yet")
            } actions: {
                Button("Create snippet") {
                    
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    UnavailableView()
}
