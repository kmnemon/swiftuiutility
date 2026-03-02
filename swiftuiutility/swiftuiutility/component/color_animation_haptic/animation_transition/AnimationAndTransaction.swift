//
//  AnimationAndTransaction.swift
//  swiftuiutility
//
//  Created by ke on 12/26/24.
//

import SwiftUI
/*
 Under the hood, both implicit and explicit animations use the same construct:
 transactions. Each view update (triggered by a state change) is wrapped in a
 transaction, which carries the information about the animation to be applied. By
 default, a transaction’s animation is nil.
 
 Animation completion handlers are part of the transaction as well, and they’re
 available as of iOS 17. We can set completion handlers directly when using the explicit
 withAnimation API, or we can add them to a transaction
 using .addAnimationCompletion within the closure of a .transaction modifier.
 Generally, these work as expected, but let’s look at some cases that aren’t entire
 */
struct AnimationAndTransaction: View {
    @State private var flag: Bool = false
    
    var body: some View {
        //1. explicit animation
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .onTapGesture {
                withAnimation(.linear) { flag.toggle() }
            }
        
        // explicit transaction implementation
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .onTapGesture {
                let t = Transaction(animation: .default)
                withTransaction(t) { flag.toggle() }
            }
        
        //2. implicit animation
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .animation(.default, value: flag)
            .onTapGesture {
                flag.toggle()
            }
        
        // implicit transaction implementation
        // this code behaves like the deprecated .animation(_:) API without the value parameter
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .transaction { t in
                t.animation = .default
            }
            .onTapGesture { flag.toggle() }
        
        
        //3. completion handlers
        //3.1 explicit
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .onTapGesture {
                print("done") //completion handlers
                withAnimation(.default) { flag.toggle() }
            }
        
        //3.2 implicit run only once
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .animation(.default, value: flag)
            .transaction {
                $0.addAnimationCompletion { print("Done!") }
            }
            .onTapGesture {
                flag.toggle()
            }
        
        //3.3 implicit run every time the animation is end
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .animation(.default, value: flag)
            .transaction(value: flag) {
                $0.addAnimationCompletion { print("Done!") }
            }
            .onTapGesture {
                flag.toggle()
            }
    }
}
