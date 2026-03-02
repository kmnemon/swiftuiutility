//
//  ListRowSeparatorModifier.swift
//  swiftuiutility
//
//  Created by ke Liu on 2/27/26.
//
import SwiftUI

struct ListRowSeparatorModifier: View {
    let names = ["a", "b", "c"]
    
    var body: some View {
        List {
            ForEach(names, id: \.self) { name in
                Text(name)
            }
            .listRowSeparator(.hidden)
        }
    }
}
