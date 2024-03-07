//
//  NavigationLinkView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI

struct NavigationLinkView: View {
    var body: some View {
        Section("1"){
            NavigationStack {
                NavigationLink("Tap Me"){
                    Text("Detail View")
                }
                .navigationTitle("1")
            }
        }
        
        Section("2") {
            NavigationStack {
                NavigationLink{
                    Text("Detail View")
                } label: {
                    VStack {
                        Text("This is the label")
                        Text("So is this")
                        Image(systemName: "face.smiling")
                    }
                    .font(.largeTitle)
                }
                .navigationTitle("2")
            }
        }
        
        Section("3") {
            NavigationStack {
                List(0..<10) { row in
                    NavigationLink("Row \(row)"){
                        Text("Detail \(row)")
                    }
                }
                .navigationTitle("3")
            }
        }
    }
}

#Preview {
    NavigationLinkView()
}
