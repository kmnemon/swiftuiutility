//
//  Frame.swift
//  swiftuiutility
//
//  Created by ke Liu on 2/11/26.
//

import SwiftUI

struct FixedFrame: View {
    var body: some View {
        Text("Hello, SwiftUI!")
            .frame(width: 200, height: 100)
            .background(Color.blue)
            .foregroundColor(.white)
        
    }
}

struct FlexibleFrame: View {
    var body: some View {
        Text("Hello, World!")
            .frame(maxWidth: .infinity)
            .background(.quaternary)
        
    }
}
