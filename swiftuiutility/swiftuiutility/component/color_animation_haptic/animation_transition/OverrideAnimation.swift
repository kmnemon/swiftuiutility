//
//  TransactionExample.swift
//  swiftuiutility
//
//  Created by ke on 2025/3/21.
//

import SwiftUI

/*
 In this instance we need to use a transaction, which gives us control over
 what’s happening in the current animation. Transactions are SwiftUI’s
 stores all the context for an animation that is currently in flight, allowing it
 to be passed around the view hierarchy.
 - also reference MakeViewAnimationWithGlobalFunction.swift
 */

//Example 1 - Disabling explicit animations based on Reduce Motion
//explicit animation:
func withMotionAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct OverrideAnimation1: View {
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

//Example 2 - Disabling implicit animations based on Reduce Motion
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

struct OverrideAnimation2: View {
    @State var scale = 1.0
    
    var body: some View {
        Button("Tap Me") {
            scale += 1
        }
        .scaleEffect(scale)
        .motionAnimation(.default, value: scale)
    }
}

//Example 3 - Disabling implicit animations on a case-by-case basis
//3.1 Disable implicit animation
struct OverrideAnimation3: View {
    @State var scale = 1.0
    
    var body: some View {
        Button("Tap Me") {
            var transaction = Transaction()
            transaction.disablesAnimations = true
            
            withTransaction(transaction) {
                scale += 1
            }
        }
        .scaleEffect(scale)
        .animation(.default, value: scale)
    }
}

//3.2 Disable implict animation and wrap in a function
func withoutAnimation<Result>(_ body: () throws -> Result) rethrows -> Result {
    var transaction = Transaction()
    //.disablesAnimations disable implicit animations
    transaction.disablesAnimations = true
    return try withTransaction(transaction, body)
}

struct DisableAnimation: View {
    @State var scale = 1.0
    
    var body: some View {
        Button("Without Animation") {
            withoutAnimation {
                scale += 1
            }
        }
        .scaleEffect(scale)
        .animation(.default, value: scale)
        
        Button("With Animation") {
            withAnimation {
                scale += 1
            }
        }
        .scaleEffect(scale)
        .animation(.default, value: scale)
    }
}

//Example 4 - Replacing implicit animations with an explicit animation on a case-by-case basis
//different animation
func withHighPriorityAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    var transaction = Transaction(animation: animation)
    //.disablesAnimations disable implicit animations
    transaction.disablesAnimations = true
    return try withTransaction(transaction, body)
}

struct OverrideAnimation4: View {
    @State var scale = 1.0
    var body: some View {
        Button("Tap Me") {
            withHighPriorityAnimation(.linear(duration: 3)) {
                scale += 1
            }
        }
        .scaleEffect(scale)
        .animation(.default, value: scale)
    }
}

//Example 5 - view hierarchy want to override an animation
/*
 This is another place where transactions solve the problem for us, but this
 time they are applied differently: we don’t want to create a new transaction
 to replace our global transaction, but instead we want each view to
 selectively override just their part of the transaction.
 */
/*
 Important: --  Apple very strongly recommends against using the
 transaction() modifier on container views, because it could generate huge
 amounts of work. Instead, use it on leaf views – views that don’t have any
 children.
 */
struct CircleGrid: View {
    var useRedFill = false
    var body: some View {
        LazyVGrid(columns: [.init(.adaptive(minimum: 64))]) {
            ForEach(0..<30) { i in
                Circle()
                    .fill(useRedFill ? .red : .blue)
                    .frame(height: 64)
                    .transaction { transaction in
                        transaction.animation = transaction.animation?.delay(Double(i) / 10)
                    }
            }
        }
    }
}

struct OverrideAnimation5: View {
    @State var useRedFill = false
    
    var body: some View {
        CircleGrid(useRedFill: useRedFill)
        
        Spacer()
        
        Button("Toggle Color") {
            withAnimation(.easeInOut) {
                useRedFill.toggle()
            }
        }
        
       
    }
}
