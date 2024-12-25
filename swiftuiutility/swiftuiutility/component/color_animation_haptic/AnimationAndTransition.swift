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
 or inserted into the render tree, there are two sparate views,there’s no frame that’s part of the render tree before and after the state
 change!
 */

struct AnimationAndTransition: View {
    @State private var tag = false
    @State private var flag = false
    
    var body: some View {
        //1. Property Animation
        Rectangle()
            .frame(width: tag ? 100 : 50, height: 50)
            .onTapGesture {
                withAnimation(.linear) { tag.toggle() }
            }
        
        //2. Transition
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
    }
}
