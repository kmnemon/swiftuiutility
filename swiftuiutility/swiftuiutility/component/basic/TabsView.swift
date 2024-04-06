//
//  TabsView.swift
//  swiftuiutility
//
//  Created by ke on 4/7/24.
//

import SwiftUI

struct TabsView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        Section("1") {
            TabView {
                Text("Tab 1")
                    .tabItem {
                        Label("One", systemImage: "star")
                    }
                
                Text("Tab 2")
                    .tabItem {
                        Label("One", systemImage: "circle")
                    }
            }
        }
        
        Section("2") {
            TabView(selection: $selectedTab) {
                Button("Show Tab 2") {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")
                
                Text("Tab 2")
                    .tabItem {
                        Label("One", systemImage: "circle")
                    }
                    .tag("Two")
            }
        }
    }
}

#Preview {
    TabsView()
}
