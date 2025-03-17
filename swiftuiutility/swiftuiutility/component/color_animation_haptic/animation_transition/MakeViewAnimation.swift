//
//  MakeViewAnimation.swift
//  swiftuiutility
//
//  Created by ke on 2025/3/17.
//

import SwiftUI

struct CountingText: View, Animatable {
    var value: Double
    var fractionLength = 8
    
    //add animatableData make the CountingTextView Animatable
    var animatableData: Double {
        get { value }
        set { value = newValue }
    }
    
    var body: some View {
        Text(value.formatted( .number.precision(.fractionLength(fractionLength)) ))
    }
}

struct MakeViewAnimation: View {
    @State private var value = 0.0
    
    var body: some View {
        CountingText(value: value)
            .onTapGesture {
                withAnimation(.linear) {
                    value = Double.random(in: 1...1000)
                }
            }
    }
}
