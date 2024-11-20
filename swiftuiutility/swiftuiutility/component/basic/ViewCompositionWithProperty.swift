//
//  ViewBuilderView.swift
//  swiftuiutility
//
//  Created by ke on 2024/9/11.
//

import SwiftUI

struct ViewCompositionWithProperty: View {
    //1. properties
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
    
    var body: some View {
        //1.
        VStack {
            motto1
            motto2
        }
        
        //2.
        spells
    }
}

#Preview {
    ViewCompositionWithProperty()
}
