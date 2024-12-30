//
//  GeometryReaderWithPreferences.swift
//  swiftuiutility
//
//  Created by ke on 12/31/24.
//

import SwiftUI
/*
 collect all subview size in an array
 */


struct SizeKey: PreferenceKey {
    static var defaultValue: [CGSize] = []
    static func reduce(value: inout [CGSize], nextValue: () -> [CGSize]) {
        value.append(contentsOf: nextValue())
    }
}

extension View {
    func measureSize() -> some View {
        overlay {
            GeometryReader { proxy in
                Color.clear
                    .preference(key: SizeKey.self, value: [proxy.size])
            }
        }
    }
}

struct GeometryReaderWithPreferences: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            ForEach(0..<5) { ix in
                Text("Item \(ix)" + String(repeating: "\n", count: ix/2))
                    .padding()
                    .measureSize()
            }
        }
        .onPreferenceChange(SizeKey.self) { print($0) }
    }
}
