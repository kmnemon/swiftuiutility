//
//  ID.swift
//  swiftuiutility
//
//  Created by ke on 12/27/24.
//

import SwiftUI

struct IDModifier: View {
    @State private var showViews = false
    @State private var viewIds = [UUID()]
    
    var body: some View {
        VStack {
            Button("Toggle Views") {
                showViews.toggle()
                
                if showViews {
                    // Insert a new view by appending a new UUID
                    viewIds.append(UUID())
                } else {
                    // Remove the last view by removing the last UUID
                    viewIds.removeLast()
                }
            }
            
            // Dynamically insert/remove views
            ForEach(viewIds, id: \.self) { id in
                Text("View \(id.uuidString)")
                    .id(id)  // Assign a unique ID to each view
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .transition(.slide)  // You can add transitions when views are inserted or removed
            }
            .animation(.default, value: viewIds)
        }
        .padding()
    }
}
