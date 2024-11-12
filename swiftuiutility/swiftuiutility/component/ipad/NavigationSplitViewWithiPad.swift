//
//  NavigationView.swift
//  swiftuiutility
//
//  Created by ke on 4/9/24.
//

import SwiftUI

struct NavigationSplitViewWithiPad: View {
    
    var body: some View {
        Section("basic") {
            NavigationSplitView {
                Text("Primary")
            } detail: {
                Text("Content")
            }
        }
        
        Section("2") { //.constant is a binding value, you can use @State value change it
            NavigationSplitView(columnVisibility: .constant(.all)) {
                NavigationLink("Primary") {
                    Text("New view")
                }
            } detail: {
                Text("Content")
            }
            .navigationSplitViewStyle(.balanced)
        }
        
        
        Section("3") {
            NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
                NavigationLink("Primary") {
                    Text("New view")
                }
            } detail: {
                Text("Content")
            }
            .navigationSplitViewStyle(.balanced)
        }
        
        Section("toolbar hidden") {
            NavigationSplitView {
                NavigationLink("Primary") {
                    Text("New view")
                }
            } detail: {
                Text("Content")
                    .toolbar(.hidden, for: .navigationBar)
            }
            .navigationSplitViewStyle(.balanced)
        }
    }
}

#Preview {
    NavigationSplitViewWithiPad()
}
