//
//  AnimationView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/15.
//

import SwiftUI

struct ImplicitAnimationView: View {
    @State private var animationAmount = 1.0
    @State private var animationAmount2 = 1.0
    @State private var animationAmount3 = 1.0
    @State private var animationAmount4 = 1.0
    @State private var animationAmount5 = 1.0
    
    var body: some View {
        VStack{
            Button("default"){
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
            //                .blur(radius: (animationAmount-1) * 2)
            .animation(.default, value: animationAmount)
            
            Button("linear"){
                animationAmount2 += 1
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount2)
            .animation(.linear, value: animationAmount2)
            
            Button("spring"){
                animationAmount3 += 1
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount3)
            .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount3)
            
            Button("easeInOut"){
                animationAmount4 += 1
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount4)
            .animation(
                .easeInOut(duration: 2)
                .delay(1)
                .repeatCount(3, autoreverses: true),
                value: animationAmount4)
            
            Button("cc"){
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount5)
                    .opacity(2 - animationAmount5)
                    .animation(
                        .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmount5)
            )
            .onAppear{
                animationAmount5 = 2
            }
        }
        
    }
}

#Preview {
    ImplicitAnimationView()
}
