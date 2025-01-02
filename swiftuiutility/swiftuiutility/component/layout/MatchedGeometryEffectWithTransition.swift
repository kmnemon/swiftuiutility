//
//  MatchedGeometryEffectWithTransition.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/31.
//

import SwiftUI

struct MatchedGeometryEffectWithTransition: View {
    @State private var hero = false
    @Namespace var namespace
    
    var body: some View {
        let circle = Circle().fill(Color.green)
        ZStack {
            if hero {
                circle
                    .matchedGeometryEffect(id: "image", in: namespace)
            } else {
                circle
                    .matchedGeometryEffect(id: "image", in: namespace)
                .frame(width: 30, height: 30) }
            
        }
        .onTapGesture {
            withAnimation(.default) {
                hero.toggle()
            }
        }
    }
}
