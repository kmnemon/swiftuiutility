//
//  TextView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/8.
//

import SwiftUI

struct TextView: View {
    @State private var checkAmount = 0.0
    
    let texts = ["hello", "world", "SwiftUI"]
    
    var body: some View {
        VStack {
            Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            
            Text("AAAAAAAAAA")
                .foregroundStyle(.secondary)
                .font(.subheadline.weight(.heavy))
            
            Text("BBBBBBBBBB")
                .foregroundStyle(.blue)
                .font(.largeTitle.weight(.semibold))
            
            Text("Guess the Flag")
                .font(.largeTitle.bold())
                .foregroundStyle(.red )
            
            Text("hello world")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
            
            Text(texts, format: .list(type: .and))
            
            Text("hello world")
                .frame(width: 300, height: 300)
                .border(.red, width: 30)
            
            Text("hello world")
                .frame(width: 300, height: 300)
                .background(Image(.mashroom))
            
            Text("hello world")
                .frame(width: 300, height: 300)
//                .border(Image(.mashroom)) This won't work
            
            Section("Parent and Child Size") {
                //the frame will change the child text view ideal size
                Text("hello, world!")
                    .frame(width: 30, height: 100)
                
                //using fixed size(), do not let the parent frame change the ideal size
                Text("hello, world!")
                    .fixedSize()
                    .frame(width: 30, height: 100)
            }
            
            
        }
        .padding()
        .multilineTextAlignment(.center)
    }
}

#Preview {
    TextView()
}
