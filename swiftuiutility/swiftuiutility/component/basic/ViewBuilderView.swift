//
//  ViewBuilderView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/20.
//

import SwiftUI

struct ViewBuilderView: View {
    @ViewBuilder var hello: some View {
        Image(systemName: "hand.wave")
        Text("Hello")
    }
    
    @ViewBuilder var bye: some View {
        Text("And GoodBye!")
        Image(systemName: "hand.wave")
    }
    
    var body: some View {
        HStack(spacing: 20) {
            hello
            Spacer()
            bye
        }
    }
}
