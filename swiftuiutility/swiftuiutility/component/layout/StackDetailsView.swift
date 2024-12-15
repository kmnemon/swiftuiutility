//
//  StackDetailsView.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/9.
//

import SwiftUI
/*
 First, the stack determines the flexibility of its subviews. The two colors are
 infinitely flexible, so they become any size we propose. The Text, however, has
 an upper limit; it can become any size between zero and its ideal size, but
 never larger than that.
 → The stack then sorts the subviews according to flexibility, from least flexible to
 most flexible. It keeps track of all the remaining subviews and the available
 remaining width.
 → While there are remaining subviews, the stack proposes the remaining width,
 divided by the number of remaining subviews.
 
 proposed size width * height
 */

struct StackDetailsView: View {
    var body: some View {
        HStack(spacing: 0) {
            Color.cyan
            Text("Hello, World!")
                .layoutPriority(1)
            Color.teal
        }
    }
}
