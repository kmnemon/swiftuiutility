//
//  SpecificAccessibilityView.swift
//  swiftuiutility
//
//  Created by ke on 4/8/24.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct SpecificAccessibilityView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    
    @Environment(\.accessibilityReduceMotion) var accessibilityReduceMotion
    @State private var scale = 1.0
    
    @Environment(\.accessibilityReduceTransparency) var accessibilityReduceTransparency
    
    var body: some View {
        Section("1.differentiate color") {
            HStack {
                if accessibilityDifferentiateWithoutColor {
                    Image(systemName: "checkmark.circle")
                }
                
                Text("Success")
            }
            .padding()
            .background(accessibilityDifferentiateWithoutColor ? .black : .green)
            .foregroundStyle(.white)
            .clipShape(.capsule)
        }
        
        
        //2.reduce motion
        Section("2.reduce motion") {
            Button("Hello, world!") {
                //style 1
                if accessibilityReduceMotion {
                    scale *= 1.5
                } else {
                    withAnimation {
                        scale *= 1.5
                    }
                }
                
                //style 2
                withOptionalAnimation {
                    scale *= 1.5
                }
            }
            .scaleEffect(scale)
        }
        
        Section("3.reduce transparency") {
            Text("Hello, world!")
                .padding()
                .background(accessibilityReduceTransparency ? .black : .black.opacity(0.5))
                .foregroundStyle(.white)
                .clipShape(.capsule)
        }
        
        Section("4.accessibility hidden") {
            Text("Hello")
                .accessibilityHidden(true)
        }
        
    }
}

#Preview {
    SpecificAccessibilityView()
}
