//
//  ViewBuilderView.swift
//  swiftuiutility
//
//  Created by ke on 2024/9/11.
//

import SwiftUI

struct ViewBuilderView: View {
    
    var motto1: some View {
        Text("Draco dormiens")
    }
    let motto2 = Text("nunquam titillandus")
    
    //2.Group
    var spells: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    //3.@ViewBuilder
    @ViewBuilder var spells1: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            motto1
            motto2
        }
    }
}

#Preview {
    ViewBuilderView()
}
