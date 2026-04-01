//
//  ImplicitAnimationView2.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/15.
//

import SwiftUI

struct ImplicitAnimationView2: View {
    @State private var enabled = false
    @State private var enabled2 = false
    @State private var enabled3 = false
    @State private var enabled4 = false


    var body: some View {
        Button("tap me 1"){
            enabled.toggle()
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        .background(enabled ? .blue : .red)
        .foregroundStyle(.white)
        .animation(.default, value: enabled)
        
        Button("tap me 2"){
            enabled2.toggle()
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        .background(enabled2 ? .blue : .red)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled2 ? 60 : 0))
        .animation(.default, value: enabled2)
        
        Button("tap me 3"){
            enabled3.toggle()
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        .background(enabled3 ? .blue : .red)
        .foregroundStyle(.white)
        .animation(.default, value: enabled3)
        .clipShape(.rect(cornerRadius: enabled3 ? 30 : 0))
        .animation(.spring(duration: 1, bounce: 0.9), value: enabled3)
        
        Button("tap me 4"){
            enabled4.toggle()
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        .background(enabled4 ? .blue : .red)
        .foregroundStyle(.white)
        .animation(nil, value: enabled4)
        .clipShape(.rect(cornerRadius: enabled4 ? 30 : 0))
        .animation(.spring(duration: 1, bounce: 0.9), value: enabled4)
    }
}

#Preview {
    ImplicitAnimationView2()
}
