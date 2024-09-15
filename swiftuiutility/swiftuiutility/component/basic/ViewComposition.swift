//
//  ViewComposition.swift
//  swiftuiutility
//
//  Created by ke on 2024/9/11.
//

import SwiftUI
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}


struct ViewComposition: View {
    var body: some View {
        CapsuleText(text: "First")
            .foregroundStyle(.white)
        CapsuleText(text: "Second")
            .foregroundStyle(.yellow)
    }
}



#Preview {
    ViewComposition()
}
