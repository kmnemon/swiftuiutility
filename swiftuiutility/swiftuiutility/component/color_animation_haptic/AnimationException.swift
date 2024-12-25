//
//  AnimationException.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/25.
//

import SwiftUI
/*
 SwiftUI views and view modifiers can be divided into “rendering“ and “non-rendering” groups (I wish I had better terms for these). In iOS 16/macOS 13, the placement of the animation modifier with respect to non-rendering modifiers is irrelevant for deciding if a change gets animated or not.

 Non-rendering modifiers include (non-exhaustive list):

 Layout modifiers (frame, padding, position, offset)
 Font modifiers (font, bold, italic, fontWeight, fontWidth)
 Other modifiers that write data into the environment, e.g. foregroundColor, foregroundStyle, symbolRenderingMode, symbolVariant
 Rendering modifiers include (non-exhaustive list):

 clipShape, cornerRadius
 Geometry effects, e.g. scaleEffect, rotationEffect, projectionEffect
 Graphical effects, e.g. blur, brightness, hueRotation, opacity, saturation, shadow
 */

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
            .scaleEffect(flag ? 1.5 : 1)
            .animation(nil, value: flag) //disable the animation
            .rotationEffect(flag ? .zero : .degrees(45))
            .animation(.default.speed(0.3), value: flag) // outer
        
        //3. animation only animates its children (with exceptions)
        Rectangle()
            .frame(width: 80, height: 80)
            .foregroundColor(.orange)
            .scaleEffect(flag ? 1 : 1.5)
            .animation(.default, value: flag)
        // Don't animate the rotation
            .rotationEffect(flag ? .zero : .degrees(45))
        
        //4. Some modifiers don’t respect the rules
        //as all three changes are animated, not just the size
        let size: CGFloat = flag ? 80 : 120
        Rectangle()
            .frame(width: size, height: size)
            .animation(.default, value: flag)
            .frame(maxWidth: .infinity, alignment: flag ? .leading : .trailing)
            .foregroundColor(flag ? .pink : .indigo)
        
        //5. padding and border
        // padding not animated
        /*
         the “rendering” view that’s affected by the padding change is the border (which is implemented as a stroked rectangle in an overlay). Since the border is a parent of the animation modifier, its geometry change is not animated
         */
        Rectangle()
            .frame(width: 80, height: 80)
            .padding(flag ? 20 : 40)
            .animation(.default, value: flag)
            .border(.primary)
            .foregroundColor(.cyan)
        
        //6. Font modifiers
        //all text properties animate, not just fontWidth
        Text("Hello!")
            .fontWidth(flag ? .condensed : .expanded)
            .animation(.default, value: flag)
            .font(.system(
                size: flag ? 40 : 60,
                weight: flag ? .regular : .heavy)
            )
        
        //7. foregroundColor
        /*
         the important factor seems to be if a view modifier actually “renders” something or not. For instance, foregroundColor just writes a color into the environment; the modifier itself doesn’t draw anything. I suppose this is why its position with respect to animation is irrelevant
         */
        RoundedRectangle(cornerRadius: flag ? 0 : 40)
          .animation(.default, value: flag)
          // Color change still animates, even though we’re outside .animation
          .foregroundColor(flag ? .pink : .indigo)
    }
}
