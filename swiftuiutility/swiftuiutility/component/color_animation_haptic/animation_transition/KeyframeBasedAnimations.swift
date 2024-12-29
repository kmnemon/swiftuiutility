//
//  KeyframeBasedAnimation.swift
//  swiftuiutility
//
//  Created by ke on 12/30/24.
//

import SwiftUI

struct ShakeData {
    var offset: CGFloat = 0
    var rotation: Angle = .zero
}

struct KeyframeBasedAnimations: View {
    @State private var trigger = 0
    
    var body: some View {
        //1. single value
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
        
        Button("Shake") {
            trigger += 1
        }
        .keyframeAnimator(initialValue: 0, trigger: trigger) { content, offset in
            content.offset(x: offset)
        } keyframes: { value in
            LinearKeyframe(-30, duration: 0.25)
            CubicKeyframe(30, duration: 0.5)
            LinearKeyframe(0, duration: 0.25)
        }
        
        //MoveKeyframe
        
        //2.multiple tracks
        Button("Shake") {
            trigger += 1
        }
        .keyframeAnimator(initialValue: ShakeData(), trigger: trigger) { content, data in
            content
                .offset(x: data.offset)
                .rotationEffect(data.rotation)
        } keyframes: { value in
            KeyframeTrack(\.offset) {
                CubicKeyframe(-30, duration: 0.25)
                CubicKeyframe(30, duration: 0.5)
                CubicKeyframe(0, duration: 0.25)
            }
            KeyframeTrack(\.rotation) {
                LinearKeyframe(.degrees(20), duration: 0.1)
                LinearKeyframe(.degrees(-20), duration: 0.2)
                LinearKeyframe(.degrees(20), duration: 0.2)
                LinearKeyframe(.degrees(-20), duration: 0.2)
                LinearKeyframe(.degrees(20), duration: 0.2)
                LinearKeyframe(.degrees(0), duration: 0.1)
            }
        }
        
        //KeyframeAnimator
        //KeyframeTimeline
        
    }
}
