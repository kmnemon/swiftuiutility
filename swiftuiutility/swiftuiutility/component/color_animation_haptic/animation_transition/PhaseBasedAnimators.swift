//
//  PhaseAnimators.swift
//  swiftuiutility
//
//  Created by ke on 12/28/24.
//

import SwiftUI

/*
 Creating these multi-phase animations takes three steps:
 
 1. Define the phases you’re going to work through. This can be any kind of sequence, but you might find it easiest to work with a CaseIterable enum.
 2. Read one phase inside your phase animator, and adjust your views to match how you want that phase to look.
 3. Optionally add a trigger to make the phase animator repeat its sequence from the beginning. Without this it will cycle constantly.
 */

extension PhaseBasedAnimators {
    enum AnimationPhase: Double, CaseIterable {
        case fadingIn = 0
        case middle = 1
        case zoomingOut = 3
    }
    
    enum AnimationPhase2: CaseIterable {
        case start, middle, end
    }
    
    enum AnimationPhase3: CaseIterable {
        case fadingIn, middle, zoomingOut

        var scale: Double {
            switch self {
            case .fadingIn: 0
            case .middle: 1
            case .zoomingOut: 3
            }
        }

        var opacity: Double {
            switch self {
            case .fadingIn: 0
            case .middle: 1
            case .zoomingOut: 0
            }
        }
    }
}

struct PhaseBasedAnimators: View {
    @State private var animationStep = 0
    
    var body: some View {
        //example 1: .phaseAnimator
        Text("Hello, world!")
            .font(.largeTitle)
            .phaseAnimator(AnimationPhase.allCases) { view, phase in
                view
                    .scaleEffect(phase.rawValue)
                    .opacity(phase.rawValue == 1 ? 1 : 0)
            }
        
        //example 1.2: with helper enum
        Text("Hello, world!")
            .font(.largeTitle)
            .phaseAnimator(AnimationPhase3.allCases) { content, phase in
                content
                    .scaleEffect(phase.scale)
                    .opacity(phase.opacity)
            }
        
        //example 2: PhaseAnimator
        VStack(spacing: 50) {
            PhaseAnimator([0, 1, 3]) { value in
                Text("Hello, world!")
                    .font(.largeTitle)
                    .scaleEffect(value)
                    .opacity(value == 1 ? 1 : 0)
                
                Text("Goodbye, world!")
                    .font(.largeTitle)
                    .scaleEffect(3 - value)
                    .opacity(value == 1 ? 1 : 0)
            }
        }
        
        //example 3: trigger value
        Button("Tap Me!") {
            animationStep += 1
        }
        .font(.largeTitle)
        .phaseAnimator(AnimationPhase2.allCases, trigger: animationStep) { content, phase in
            content
                .blur(radius: phase == .start ? 0 : 10)
                .scaleEffect(phase == .middle ? 3 : 1)
        }
        
        // example 4: specify exactly which animation to use for each phase
        Button("Tap Me!") {
            animationStep += 1
        }
        .font(.largeTitle)
        .phaseAnimator(AnimationPhase2.allCases, trigger: animationStep) { content, phase in
            content
                .blur(radius: phase == .start ? 0 : 10)
                .scaleEffect(phase == .middle ? 3 : 1)
        } animation: { phase in
            switch phase {
                case .start, .end: .bouncy
                case .middle: .easeInOut(duration: 2)
            }
        }
    }
}
