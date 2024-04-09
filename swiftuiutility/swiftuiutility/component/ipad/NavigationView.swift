//
//  NavigationView.swift
//  swiftuiutility
//
//  Created by ke on 4/9/24.
//

import SwiftUI

struct NavigationView: View {
    
    var body: some View {
        Section("1") {
            NavigationSplitView(columnVisibility: .constant(.all)) {
                NavigationLink("Primary") {
                    Text("New view")
                }
            } detail: {
                Text("Content")
            }
            .navigationSplitViewStyle(.balanced)
        }
        
        
        Section("2") {
            NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
                NavigationLink("Primary") {
                    Text("New view")
                }
            } detail: {
                Text("Content")
            }
            .navigationSplitViewStyle(.balanced)
        }
    }
}

#Preview {
    NavigationView()
}
