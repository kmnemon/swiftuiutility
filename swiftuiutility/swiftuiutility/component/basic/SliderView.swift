//
//  SliderView.swift
//  swiftuiutility
//
//  Created by ke on 4/4/24.
//

import SwiftUI

struct SliderView: View {
    @State private var blurAmount = 0.0
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
        }
    }
}

#Preview {
    SliderView()
}
