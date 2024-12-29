//
//  AnimatableView.swift
//  swiftuiutility
//
//  Created by ke on 12/28/24.
//

import SwiftUI

extension AnimatableAndPhaseBasedAnimation {
    //1. implement an animatable opacity modifier ourselves
    struct MyOpacity: ViewModifier, Animatable {
        var animatableData: Double
        init(_ opacity: Double) {
            animatableData = opacity
        }
        func body(content: Content) -> some View {
            let _ = print(animatableData)
            content.opacity(animatableData)
        }
    }
    
    //2. implement shake using animatable before iOS 17
    struct Shake: ViewModifier, Animatable {
        var numberOfShakes: Double
        var animatableData: Double {
            get { numberOfShakes }
            set { numberOfShakes = newValue }
        }
        func body(content: Content) -> some View {
            content
                .offset(x: -sin(numberOfShakes * 2 * .pi) * 30)
        }
    }
    
    //3. implement shake using iOS 17 Phase-Based Animations (.phaseAnimator)
    //see blow
    
}


struct AnimatableAndPhaseBasedAnimation: View {
    @State private var flag = false
    @State private var shakes = 0
    @State private var trigger = 0
    
    var body: some View {
        //1.
        Button("Animate Opacity") { flag.toggle() }
            .modifier(MyOpacity(flag ? 1 : 0.3))
            .animation(.linear(duration: 1), value: flag)
        //2.
        Button("Shake!") { shakes += 1 }
            .modifier(Shake(numberOfShakes: Double(shakes)))
            .animation(.default, value: shakes)
        
        //3.iOS 17 shake - Phase-Based Animations
        //because we have a trigger value the shake will trigger once, when we don't have that the shake will loop
        Button("Shake") { shakes += 1 }
        .phaseAnimator([0, -20, 20], trigger: shakes) { content, offset in
            content.offset(x: offset)
        }
        
        // shake loop
        Button("Shake") { shakes += 1 }
        .phaseAnimator([0, -20, 20]) { content, offset in
            content.offset(x: offset)
        }
        
        //4.Keyframe-Based Animations
        Button("Shake") {
            trigger += 1
        }
        .keyframeAnimator(initialValue: 0, trigger: trigger) { content, offset in
            content.offset(x: offset)
        } keyframes: { value in
            CubicKeyframe(-30, duration: 0.25)
            CubicKeyframe(30, duration: 0.5)
            CubicKeyframe(0, duration: 0.25)
        }
        
        //PhaseAnimators
        
    }
}
