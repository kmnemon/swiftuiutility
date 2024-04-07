//
//  HitTestingView.swift
//  swiftuiutility
//
//  Created by ke on 4/7/24.
//

import SwiftUI

struct HitTestingView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            Circle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    print("Circle tapped!")
                }
                .allowsHitTesting(false)
        }
        
        //contentShape example 1
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            Circle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .contentShape(.rect)
                .onTapGesture {
                    print("Circle tapped!")
                }
        }
        //contentShape example 2
        VStack {
            Text("Hello")
            
            Spacer()
                .frame(height: 100)
            
            Text("World")
        }
        .contentShape(.rect)
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview {
    HitTestingView()
}
