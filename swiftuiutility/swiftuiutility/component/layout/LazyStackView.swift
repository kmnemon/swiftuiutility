//
//  LazyStackView.swift
//  swiftuiutility
//
//  Created by ke on 12/14/24.
//

import SwiftUI
/*
 lazy stacks don’t attempt to distribute the available space along the major axis among their subviews
 proposed size width * nil to it's subview, the subviews become their ideal width
 */

struct LazyStackView: View {
    var body: some View {
        LazyVStack {
            Text("hello World")
        }
    }
}
