//
//  NavigationStackView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI

struct NavigationStackView: View {
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    Text("Hello, World!")
                }
                
                Section{
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStackView()
}
