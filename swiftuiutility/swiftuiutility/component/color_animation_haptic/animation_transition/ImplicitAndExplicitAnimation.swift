//
//  ImplicitAndExplicitAnimation.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/25.
//

import SwiftUI
/*
 1. Implicit animations occur when a particular value changes.
 2. Explicit animations occur when a particular event takes place.
 
 different -
 For example, consider the case where a change in the model layer (perhaps by new data being pushed from the server) results in a particular value changing. When using an implicit animation that’s scoped to that value, the change to the render tree will be animated, regardless of the source, but the scope within the view is well-defined. With explicit animations, we can easily distinguish between updates from the model layer and user interactions, but we can’t directly restrict the animation to certain parts of the view tree.
 
 precedence -
 Since both types of animation just set the animation property of the current transaction under the hood, implicit animations take precedence over explicit animations. The modifier setting the implicit animation will be executed later while evaluating the view tree, therefore overriding any explicit animation that might have been set at the start of the state change.
 */

struct ImplicitAndExplicitAnimation: View {
    @State private var flag = false
    @State private var tag = false
    
    var body: some View {
        //1. implicit animation - two parameters: the first one specifies the timing curve to be used for the animation, and the second one specifies the value that needs to change for the animation to be applied.
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .animation(.default, value: flag)
            .onTapGesture {
                flag.toggle()
            }
        //This will only animate the rotation eﬀect, and not the opacity, when the flag value changes.
        Text("Hello World")
            .opacity(flag ? 1 : 0)
            .animation(.default) {
                $0.rotationEffect(flag ? .zero : .degrees(90))
            }
        //The same as above
        Text("Hello World")
            .opacity(flag ? 1 : 0)
            .animation(nil, value: flag)
            .rotationEffect(flag ? .zero : .degrees(90))
            .animation(.default, value: flag)
        
        
        //2. explicit animation
        //scope an animation to particular state changes
        Rectangle()
            .frame(width: tag ? 100 : 50, height: 50)
            .onTapGesture {
                withAnimation(.linear) { tag.toggle() }
            }
        
        //Binding animations
        ToggleRectangle(flag: $flag.animation(.default))
        
        
    }
}

//Binding animations
struct ToggleRectangle: View {
    @Binding var flag: Bool
    
    var body: some View {
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .onTapGesture {flag.toggle() }
    }
}
