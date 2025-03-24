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

//example1: Disable implicit animation
struct TransactionExample1: View {
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

//example2: Disable implict animation and wrap in a function
func withoutAnimation<Result>(_ body: () throws -> Result) rethrows -> Result {
    var transaction = Transaction()
    //.disablesAnimations disable implicit animations
    transaction.disablesAnimations = true
    return try withTransaction(transaction, body)
}

struct TransactionExample2: View {
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

//example 3: different animation
func withHighPriorityAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    var transaction = Transaction(animation: animation)
    //.disablesAnimations disable implicit animations
    transaction.disablesAnimations = true
    return try withTransaction(transaction, body)
}

struct TransactionExample3: View {
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
