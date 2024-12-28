//
//  CustomTransition.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/27.
//

import SwiftUI

struct MyOpacity: ViewModifier {
    var value: Double
    func body(content: Content) -> some View {
        content.opacity(value)
    }
}

struct MyScale: ViewModifier {
    var scale: CGFloat
    func body(content: Content) -> some View {
        content.scaleEffect(scale)
    }
}

struct Blur: ViewModifier {
    var radius: CGFloat
    func body(content: Content) -> some View {
        content
            .blur(radius: radius)
    }
}

extension AnyTransition {
    static let myOpacity = AnyTransition.modifier(
        active: MyOpacity(value: 0),
        identity: MyOpacity(value: 1)
    )
    
    static let myScale = AnyTransition.modifier(
        active: MyScale(scale: 0),
        identity: MyScale(scale: 1)
    )
    
    static func blur(radius: CGFloat) -> Self {
        .modifier(active: Blur(radius: radius), identity: Blur(radius: 0))
    }
}

//For iOS 17 new API
struct BlurTransition: Transition {
    var radius: CGFloat
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .blur(radius: phase.isIdentity ? 0 : radius)
    }
}

extension Transition where Self == BlurTransition {
    static func blur(radius: CGFloat) -> Self {
        BlurTransition(radius: radius)
    }
}




struct CustomTransition: View {
    @State private var flag = false
    
    var body: some View {
        VStack {
            Button("Toggle") {
                withAnimation { flag.toggle() }
            }
            if flag {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .transition(.myScale)
            }
            
            Button("Toggle") {
                withAnimation { flag.toggle() }
            }
            if flag {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .transition(.blur(radius: 5))
            }
        }
    }
}
