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
        
        //2. explicit animation
        Rectangle()
            .frame(width: tag ? 100 : 50, height: 50)
            .onTapGesture {
                withAnimation(.linear) { tag.toggle() }
            }
        

    }
}
