//
//  Background.swift
//  swiftuiutility
//
//  Created by ke Liu on 2/11/26.
//

import SwiftUI

//place the secondard subview in behind of the primary subview
struct Background: View {
    var body: some View {
        Text("Hello")
            .padding(10)
            .background(Color.teal)
        
    }
}

extension View {
    func highlight(enabled: Bool = true) -> some View {
        background {
            if enabled {
                Color.orange
                    .padding(-3)
            }
        }
    }
}
