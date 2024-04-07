//
//  SwipeActionsModifier.swift
//  swiftuiutility
//
//  Created by ke on 4/7/24.
//

import SwiftUI

struct SwipeActionsModifier: View {
    var body: some View {
        List {
            Text("Swipe me")
                .swipeActions {
                    Button("Send message", systemImage: "message") {
                        print("Hi")
                    }
                }
            
            Text("Swipe me left and right")
                .swipeActions {
                    Button("Delete", systemImage: "minus.circle", role: .destructive) {
                        print("Delete")
                    }
                }
            
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning")
                    }
                    .tint(.orange)
                }
                
                
        }
    }
}

#Preview {
    SwipeActionsModifier()
}
