//
//  GeometryReaderWithOverlayPreferenceValue.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/31.
//

import SwiftUI
/*
 anchors are most useful when we ﬁnd ourselves converting coordinates or sizes between diﬀerent coordinate spaces
 */

struct HighlightKey: PreferenceKey {
    typealias Value = Anchor<CGRect>?
    static var defaultValue: Anchor<CGRect>?
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value ?? nextValue()
    }
}

struct GeometryReaderWithAnchor: View {
    var body: some View {
        VStack {
            Button("Sign Up") {}
            Button("Log In") {}
                .anchorPreference(key: HighlightKey.self, value: .bounds, transform: { $0 })
        }
        .border(Color.green)
        .overlayPreferenceValue(HighlightKey.self) { value in
            if let anchor = value {
                GeometryReader { proxy in
                    let rect = proxy[anchor]
                    Ellipse()
                        .strokeBorder(Color.red, lineWidth: 1)
                        .padding(-5)
                        .frame(width: rect.width, height: rect.height)
                        .offset(x: rect.origin.x, y: rect.origin.y)
                }
            }
        }
    }
}
