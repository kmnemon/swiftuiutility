//
//  CustomView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/11.
//

import SwiftUI

struct CapsuleText: View{
    var text: String
    
    var body: some View{
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct CustomView: View {
    var body: some View {
        CapsuleText(text: "hello")
            .foregroundStyle(.white)
        CapsuleText(text: "world")
            .foregroundStyle(.yellow)
    }
}

#Preview {
    CustomView()
}
