//
//  ListView2.swift
//  swiftuiutility
//
//  Created by ke on 4/7/24.
//

import SwiftUI

struct ListView2: View {
    let people = ["finn", "leia", "link", "rey"]
    @State private var selection: String?
    @State private var selections = Set<String>()
    
    var body: some View {
        Section("select item") {
            List(people, id: \.self, selection: $selection) { p in
                    Text(p)
            }
            
            if let selection {
                Text("You selected \(selection)")
            }
        }
        
        Section("select items") {
            List(people, id: \.self, selection: $selections) { p in
                    Text(p)
            }
            
            if selections.isEmpty == false {
                Text("You selected \(selections.formatted())")
            }
            
            EditButton()
        }
    }
}

#Preview {
    ListView2()
}
