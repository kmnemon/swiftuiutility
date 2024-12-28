//
//  AnimationAndTransition.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/25.
//

import SwiftUI
/*
 1. Property animations interpolate changed properties of views that exist in the view
 tree before and after the state change, the views is the same only property change
 
 2. transitions are animations that are applied to views being removed from
 or inserted into the render tree, there are two sparate views,there’s no frame that’s part of the render tree before and after the state change!
 
 Transitions have two states: the active state, and the identity state.
 when a view is inserted: active -> identity .opacity(0)
 when a view is removed: identity -> active .opacity(1)
 */

struct TransitionView: View {
    @State private var flag = false
    
    var body: some View {
        //1. Property Animation
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .onTapGesture {
                withAnimation(.linear) { flag.toggle() }
            }
        
        //2.1 Transition With explict animation
        let rect = Rectangle().onTapGesture {
            withAnimation { flag.toggle() }
        }
        
        if flag {
            rect
                .frame(width: 200, height: 100)
        } else {
            rect
                .frame(width: 100, height: 100)
        }
        
        //2.2 Transition With implicit animation
        Button("tap") {
            flag.toggle()
        }
        .padding(60)
        
        VStack {
            if flag {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .transition(.blur(radius: 5))
            }
        }
        .animation(.default, value: flag)
        
        //3. Explicit Transition
        if flag {
            rect
                .frame(width: 200, height: 100)
                .transition(.opacity)
        }
        
        //4. build-in Transition
        if flag {
            rect
                .frame(width: 200, height: 100)
                .transition(.slide)
        }
        
        if flag {
            rect
                .frame(width: 200, height: 100)
                .transition(.scale)
        }
        
        if flag {
            rect
                .frame(width: 200, height: 100)
                .transition(.move(edge: .trailing))
        }
        
    }
}
