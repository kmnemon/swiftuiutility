//
//  VisualEffectView.swift
//  swiftuiutility
//
//  Created by ke on 4/8/24.
//

import SwiftUI

struct VisualEffectView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { number in
                    Text("Number \(number)")
                        .font(.largeTitle)
                        .padding()
                        .background(.red)
                        .frame(width: 200, height: 200)
                        .visualEffect { content, proxy in
                            content
                                .rotation3DEffect(
                                    .degrees(-proxy.frame(in: .global).minX / 8),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                        }
                }
            }
            .scrollTargetLayout() // tell swiftui we want to make each view inside the HStack be a scroll target
        }
        .scrollTargetBehavior(.viewAligned) //tell swiftui i should make the scroll view move smoothly between all the scroll targets it contains
    }
}

#Preview {
    VisualEffectView()
}
