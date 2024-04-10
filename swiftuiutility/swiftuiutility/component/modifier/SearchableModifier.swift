//
//  SearchableModifier.swift
//  swiftuiutility
//
//  Created by ke on 4/10/24.
//

import SwiftUI

struct SearchableModifier: View {
    @State private var searchText = ""
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            allNames
        } else {
            allNames.filter { name in
                name.localizedStandardContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
//            Text("Searching for \(searchText)")
//                .searchable(text: $searchText, prompt: "Look for something")
//                .navigationTitle("Searching")
            
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
}

#Preview {
    SearchableModifier()
}
