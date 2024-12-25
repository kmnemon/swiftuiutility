//
//  AnimationException.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/25.
//

import SwiftUI

struct AnimationException: View {
    @State private var flag = false
    
    var body: some View {
        Button("flag") {
            flag.toggle()
        }
        .padding()
        
        //1. Sibling views can have different animations
        HStack(spacing: 40) {
            Rectangle()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)
                .scaleEffect(flag ? 1 : 1.5)
                .animation(.easeOut(duration: 0.5), value: flag)
            
            Rectangle()
                .frame(width: 80, height: 80)
                .foregroundColor(flag ? .yellow : .red)
                .rotationEffect(flag ? .zero : .degrees(45))
                .animation(.easeOut(duration: 2.0), value: flag)
            
            Rectangle()
                .frame(width: 80, height: 80)
                .foregroundColor(flag ? .pink : .mint)
        }
        
        //2. Nested animation modifiers
        /*
         the inner modifier can override the outer animation for its subviews. The outer animation applies to view modifiers that are placed between the two animation modifiers.
         */
        Rectangle()
              .frame(width: 80, height: 80)
              .foregroundColor(.green)
              .scaleEffect(flag ? 1 : 1.5)
              .animation(.default, value: flag) // inner
              .rotationEffect(flag ? .zero : .degrees(45))
              .animation(.default.speed(0.3), value: flag) // outer
    }
}
