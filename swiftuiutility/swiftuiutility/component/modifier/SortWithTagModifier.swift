//
//  SortWithTagModifier.swift
//  swiftuiutility
//
//  Created by ke on 11/7/24.
//

import SwiftUI

struct SortWithTagModifier: View {
    @State private var sortOrder: String = "name"
    
    var body: some View {
        NavigationStack {
            Menu("Sort", systemImage: "arrow.up.arrow.down") {
                Picker("Sort", selection: $sortOrder) {
                    Text("Sort by Name")
                        .tag("name")
                    Text("Sort by Price")
                        .tag("price")
                }
            }
        }
    }
}
