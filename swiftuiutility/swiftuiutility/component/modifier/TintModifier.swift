//
//  TintModifier.swift
//  swiftuiutility
//
//  Created by ke Liu on 3/4/26.
//

import SwiftUI


struct TintModifier: View {
    @State private var flag = false
    
    var body: some View {
        Button {
            flag.toggle()
        } label: {
            Image(systemName: flag
                  ? "checkmark.square" : "arrow.uturn.backward.square")
        }
        .tint(flag ? .green : .blue)
    }
}
