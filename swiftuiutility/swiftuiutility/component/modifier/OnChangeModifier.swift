//
//  OnChangeModifier.swift
//  swiftuiutility
//
//  Created by ke on 4/4/24.
//

import SwiftUI

struct OnChangeModifier: View {
    @State private var blurAmount = 0.0
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) { oldValue, newValue in
                        print("New value is \(newValue)")
                }
            
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

#Preview {
    OnChangeModifier()
}
