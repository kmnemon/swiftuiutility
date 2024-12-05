//
//  PaddingModifier.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/4.
//

import SwiftUI

struct PaddingModifier: View {
    var body: some View {
        //1 .padding - for example, by writing .padding() without any arguments — the default padding for the current platform is used.
        Text("Hello, World!")
            .padding()
            .border(.red)
        
        Text("Hello, World!")
            .padding(20)
            .border(.red)
        
        //2 .padding(_ inset:) lets us specify diﬀerent padding values for diﬀerent edges in one call using an EdgeInset value.
        Text("What's wrong with this world!")
            .padding(.init(top: 10, leading: 20, bottom: 30, trailing: 40))
            
        //3 .padding(_ edges:_ length:) lets us specify one padding value for a set of edges (.horizontal and .vertical can be especially handy for the edges).
        Text("What's wrong with this world!")
            .padding(.top, 10)
            .padding(.horizontal, 20)

    }
}
