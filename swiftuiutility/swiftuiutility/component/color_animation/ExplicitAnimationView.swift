//
//  ExplicitAnimationView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/15.
//

import SwiftUI

struct ExplicitAnimationView: View {
    @State private var animationAmount = 0.0
    @State private var animationAmount1 = 0.0
    
    var body: some View {
        Button("tap me"){
            withAnimation{
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount),
                          axis: (x: 0, y: 1, z: 0)
        )
        
        Button("tap me"){
            withAnimation(.spring(duration: 1, bounce: 0.5)){
                animationAmount1 += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount1),
                          axis: (x: 0, y: 1, z: 0)
        )
    }
}

#Preview {
    ExplicitAnimationView()
}
