//
//  GroupViewWithException.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/20.
//

import SwiftUI

struct GroupViewWithException: View {
    //1. normal - the border will be applied to each of the two views
    var body: some View {
        HStack {
            Group {
                Image(systemName: "hand.wave")
                Text("Hello")
            }
            .border(.blue)
        }
    }
    
    //2. exception - the Group act like VStack
    var body1: some View {
        Group {
            Image(systemName: "hand.wave")
            Text("Hello")
        }
        .border(.blue)
    }
    
    //3. exception2 - When placing a group within an overlay or background, it behaves like an implicit ZStack
    var body2: some View {
        VStack {
            Text("Main Content")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(width: 300, height: 200)
        .background(Color.blue) 
        .cornerRadius(20)
        .overlay(
            Group {
                Text("Overlay View 1")
                    .font(.title2)
                    .foregroundColor(.yellow)
                
                Text("Overlay View 2")
                    .font(.body)
                    .foregroundColor(.yellow)
            }
                .padding()
                .background(Color.black.opacity(0.6), in: RoundedRectangle(cornerRadius: 20))
                .padding(10)
            , alignment: .top)
    }
}
