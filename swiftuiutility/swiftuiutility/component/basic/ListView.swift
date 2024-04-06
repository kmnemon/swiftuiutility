//
//  ListView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI

struct ListView: View {
    let people = ["finn", "leia", "link", "rey"]
    
    var body: some View {
        VStack {
            Section("1") {
                List {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
            }
            
            Section("2") {
                List {
                    Text("Static Row 1")
                    Text("Static Row 2")

                    ForEach(0..<5) {
                        Text("Dynamic Row \($0)")
                    }
                    
                    Text("Static Row 3")
                    Text("Static Row 4")
                }
            }
            .listStyle(.grouped)
            
            Section("3") {
                List(0..<5){
                    Text("Dynamic Row \($0)")
                }
            }
            
            Section("4") {
                List(people, id:\.self) {
                    Text($0)
                }
                
                List {
                    ForEach(people, id:\.self){
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    ListView()
}
