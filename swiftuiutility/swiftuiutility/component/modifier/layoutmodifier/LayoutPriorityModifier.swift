//
//  LayoutPriorityModifier.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/9.
//

import SwiftUI

struct LayoutPriorityModifier: View {
    var body: some View {
        HStack(spacing: 0) {
            Color.cyan
            Text("Hello, World!")
                .layoutPriority(1)
            Color.teal
        }
    }
}
