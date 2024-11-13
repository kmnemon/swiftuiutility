//
//  SpecialEffectsBlurBlend.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/13.
//

import SwiftUI

struct SpecialEffectsBlurBlend: View {
    @State private var amount = 0.0
    
    var body: some View {
        //blend mode 1
        ZStack {
            Image("mashroom")
            
            Rectangle()
                .fill(.red)
                .blendMode(.multiply)
        }
        
        //blend mode 1a
        Image("mashroom")
            .colorMultiply(.red)
        
        //blend mode 2 - screen effects
        VStack {
            ZStack {
                Circle()
                    .fill(.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.green)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
        
        //blur
        VStack {
            Image("mashroom")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}
