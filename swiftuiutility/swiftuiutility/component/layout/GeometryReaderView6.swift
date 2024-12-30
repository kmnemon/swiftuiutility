//
//  GeometryReaderMeasure.swift
//  swiftuiutility
//
//  Created by ke on 12/31/24.
//

import SwiftUI

struct GeometryReaderView6: View {
    var body: some View {
        Text("hello")
            .padding()
            .background {
                GeometryReader { proxy in
                    let radius: CGFloat = proxy.size.width > 50 ? 10 : 5
                    RoundedRectangle(cornerRadius: radius)
                        .fill(.blue)
                }
            }
    }
}
