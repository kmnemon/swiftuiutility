//
//  LayoutPriority.swift
//  swiftuiutility
//
//  Created by ke Liu on 2/11/26.
//

import SwiftUI

struct LayoutPriority: View {
    var body: some View {
        HStack(spacing: 0) {
            Color.cyan
            Text("Hello, World!")
                .layoutPriority(1.0)
            Color.teal
        }
        .frame(width: 150, height: 50)
        
        //the same as fixed size modifier
        HStack(spacing: 0) {
            Color.cyan
            Text("Hello, World!")
                .fixedSize()
            Color.teal
        }
        .frame(width: 150, height: 50)
    }
}
