//
//  TransformEnvironment.swift
//  swiftuiutility
//
//  Created by ke Liu on 4/10/25.
//

import SwiftUI
/*
 The .transformEnvironment modifier in SwiftUI is used to modify an environment value before it's passed down to a view's child views.
 
 This is different from just setting the environment value with .environment(\.font, ...) because:

 1. It transforms the existing value rather than replacing it entirely
 2. It preserves any other attributes the font might have had
 3. It works with whatever font is already in the environment (if any)
 */

struct WelcomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "sun.max")
                .transformEnvironment(\.font) { font in
                    font = font?.weight(.black)
                }
            Text("Welcome!")
        }
    }
}



struct TransformEnvironment: View {
    var body: some View {
        WelcomeView()
            .font(.headline)
    }
}
