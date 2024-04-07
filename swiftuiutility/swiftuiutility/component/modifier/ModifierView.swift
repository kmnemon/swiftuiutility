//
//  ModifierView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/10.
//

import SwiftUI

struct ModifierView: View {
    var body: some View {
        //environment modifier, you can override it
        VStack{
            Text("Hello, World!")
                .font(.largeTitle)
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
        }
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        
        //regular modifier, you can not unblur
        VStack{
            Text("Hello, World!")
                .blur(radius: 0)
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
        }
        .blur(radius: 5)
    }
}

#Preview {
    ModifierView()
}
