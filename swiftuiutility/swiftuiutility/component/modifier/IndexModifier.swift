//
//  IndexModifier.swift
//  swiftuiutility
//
//  Created by ke on 2025/3/14.
//

import SwiftUI

struct IndexModifier: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 100, height: 100, alignment: .center)
                .zIndex(1) // Top layer.


            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100, alignment: .center)
                .rotationEffect(.degrees(45))
                // Here a zIndex of 0 is the default making
                // this the bottom layer.
        }
    }
}
