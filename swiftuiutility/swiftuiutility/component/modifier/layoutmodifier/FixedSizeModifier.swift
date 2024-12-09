//
//  FixedSizeModifier.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/9.
//

import SwiftUI


struct FixedSizeModifier: View {
    var body: some View {
        VStack {
            Text("Hello World!")
                .fixedSize()
        }
        .frame(width: 30)
        .border(.blue)
    }
}
