//
//  OpacityView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/12.
//
import SwiftUI

struct OpacityView: View {
    var body: some View {
        VStack {
            Image(.mashroom)
                .resizable()
                .scaledToFit()
                .opacity(0)
            
            Image(.mashroom)
                .resizable()
                .scaledToFit()
                .opacity(0.5)
            
            
            Image(.mashroom)
                .resizable()
                .scaledToFit()
                .opacity(1.0)
        }
    }
}
