//
//  MakeViewAnimation.swift
//  swiftuiutility
//
//  Created by ke on 2025/3/17.
//

import SwiftUI

//example 1:
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

//example 2:
struct TypewriterText: View, Animatable {
    var string: String
    var count = 0
    
    var animatableData: Double {
        get { Double(count) }
        set { count = Int(max(0, newValue)) }
    }
    
    var body: some View {
        let stringToShow = String(string.prefix(count))
        //Text(stringToShow)
        ZStack {
            Text(string)
                .hidden()
                .overlay(
                    Text(stringToShow),
                    alignment: .topLeading
                )
        }
    }
}

struct MakeViewAnimation2: View {
    @State private var value = 0
    let message = "This is a very long piece of text"
    
    
    var body: some View {
        VStack {
            TypewriterText(string: message, count: value)
                .frame(width: 300, alignment: .leading)
            
            Button("Type!") {
                withAnimation(.linear(duration: 2)) {
                    value = message.count
                }
            }
            
            Button("Reset") {
                value = 0
            }
        }
    }
}


