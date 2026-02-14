//
//  AnimationBindingView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/15.
//

import SwiftUI

//example 1:
struct AnimationBindingView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack{
            Stepper("scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("tap me"){
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
    }
}

//example 2:
struct ToggleRectangle2: View {
    @Binding var flag: Bool
    var body: some View {
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .onTapGesture { flag.toggle() }
    }
}

struct AnimationBindingView2 : View {
    @State private var flag = false
    var body: some View {
        ToggleRectangle2(flag: $flag.animation(.default))
    }
}

#Preview {
    AnimationBindingView()
}
