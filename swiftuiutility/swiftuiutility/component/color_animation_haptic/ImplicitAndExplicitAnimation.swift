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
        Rectangle()
            .frame(width: tag ? 100 : 50, height: 50)
            .onTapGesture {
                withAnimation(.linear) { tag.toggle() }
            }
        
        
    }
}
