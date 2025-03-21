//
//  MakeViewAnimation2.swift
//  swiftuiutility
//
//  Created by ke on 2025/3/21.
//
import SwiftUI

//explicit animation:
func withMotionAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct MakeViewAnimationWithGlobalFunction: View {
    @State var scale = 1.0
    
    var body: some View {
        Button("Tap Me") {
            withMotionAnimation {
                scale += 1
            }
        }
        .scaleEffect(scale)
    }
}

//implicit animation
struct MotionAnimationModifier<V: Equatable>: ViewModifier {
    @Environment(\.accessibilityReduceMotion) var accessibilityReduceMotion
    let animation: Animation?
    let value: V
    
    func body(content: Content) -> some View {
        if accessibilityReduceMotion {
            content
        } else {
            content.animation(animation, value: value)
        }
    }
}

extension View {
    func motionAnimation<V: Equatable>(_ animation: Animation?, value: V) -> some View {
        self.modifier(MotionAnimationModifier(animation: animation, value: value))
    }
}

struct MakeViewAnimationWithGlobalFunction2: View {
    @State var scale = 1.0
    
    var body: some View {
        Button("Tap Me") {
            scale += 1
        }
        .scaleEffect(scale)
        .motionAnimation(.default, value: scale)
    }
}
