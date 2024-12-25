//
//  ButtonStyle.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/25.
//

import SwiftUI

struct SomeButtonStylesExample: View {
    var body: some View {
        Button {
            // Continue
        } label: {
            HStack {
                Spacer()
                Text("Continue")
                Spacer()
            }
            .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
        }
        .font(.system(.title2, design: .rounded, weight: .bold))
        .foregroundColor(.yellow)
        .background(Capsule().stroke(.yellow, lineWidth: 2))
    }
}
