//
//  SymbolVariantModifier.swift
//  swiftuiutility
//
//  Created by ke Liu on 3/2/26.
//

import SwiftUI

struct InMemoryDynamicSortView: View {
    @State private var orderAscending = true
    let parks = ["parkA", "parkB"]
    
    var body: some View {
        NavigationStack {
            List(parks, id: \.self) { park in
                Text(park)
            }
            .navigationTitle("Parks")
            .toolbar {
                Button("", systemImage: "arrow.up.arrow.down.circle") {
                    orderAscending.toggle()
                }
                .symbolVariant(orderAscending ? .none : .fill)
            }
        }
    }
}
