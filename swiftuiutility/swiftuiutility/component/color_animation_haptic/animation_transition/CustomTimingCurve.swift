//
//  CustomTimingCurve.swift
//  swiftuiutility
//
//  Created by ke on 2025/3/18.
//

import SwiftUI

//example 1: edgeBounce
extension Animation {
    static var edgeBounce: Animation {
        Animation.timingCurve(0, 1, 1, 0)
    }
    
    static func edgeBounce(duration: TimeInterval = 0.2) -> Animation {
        Animation.timingCurve(0, 1, 1, 0, duration: duration)
    }
}


struct CustomTimingCurve: View {
    @State private var offset = -200.0
    
    var body: some View {
        Text("Hello, world!")
            .offset(y: offset)
            .animation(.edgeBounce(duration: 2)
                .repeatForever(autoreverses: true), value: offset)
            .onTapGesture {
                offset = 200
            }
    }
}

//example 2: ease in out back
//https://cubic-bezier.com/#.17,.67,.83,.67
extension Animation {
    //easeInOutBack
    static var easeInOutBack: Animation {
        Animation.timingCurve(0.5, -0.5, 0.5, 1.5)
    }
    static func easeInOutBack(duration: TimeInterval = 0.2) -> Animation {
        Animation.timingCurve(0.5, -0.5, 0.5, 1.5, duration: duration)
    }
    
    //easeInOutBackSteep
    static var easeInOutBackSteep: Animation {
        Animation.timingCurve(0.7, -0.5, 0.3, 1.5)
    }
    
    static func easeInOutBackSteep(duration: TimeInterval = 0.2) -> Animation {
        Animation.timingCurve(0.7, -0.5, 0.3, 1.5, duration: duration)
    }
}



struct CustomTimingCurve2: View {
    @State private var isAnimating = false

    var body: some View {
        VStack {
            // A simple rectangle that will animate
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .scaleEffect(isAnimating ? 1.5 : 1.0)
                .animation(.easeInOutBack(duration: 1.0), value: isAnimating)

            // Another rectangle with a different custom animation
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
                .scaleEffect(isAnimating ? 1.5 : 1.0)
                .animation(.easeInOutBackSteep(duration: 1.0), value: isAnimating)

            // Button to trigger the animation
            Button("Animate") {
                isAnimating.toggle()
            }
            .padding()
        }
    }
}
