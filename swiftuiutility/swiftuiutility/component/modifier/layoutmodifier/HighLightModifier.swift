//
//  HighLightModifier.swift
//  swiftuiutility
//
//  Created by ke on 12/6/24.
//

import SwiftUI
/*
            background
                |
      -------------------------
      |                        |
   Text                    padding(-3)
 (proposed size 10 * 10)    (proposed size 10 * 10)
 (reported size 10 * 10)    (proposed size to color 13 * 13)
                               |
                             Color
 */



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

struct HighLightModifier: View {
    var body: some View {
        Text("Hello, World!")
            .highlight()
    }
}
