//
//  MenuView.swift
//  swiftuiutility
//
//  Created by ke on 3/31/24.
//

import SwiftUI

struct MenuView: View {
    @State private var sortOrder: [String] = [""]

    var body: some View {
        Menu("Sort", systemImage: "arrow.up.arrow.down"){
            Picker("Sort", selection: $sortOrder) {
                Text("Sort by Name")
                    .tag([
                        "Name"
                    ])
                Text("Sort by Join Date")
                    .tag([
                        "Date"
                    ])
            }
        }
        
        Text("Your choose is: \(sortOrder[0])")
    }
}

#Preview {
    MenuView()
}
