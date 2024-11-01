//
//  StateWrapperView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/1.
//

import SwiftUI

struct StateWrapperView: View {
    //the @State is a struct that wrapper the actual value in it
    @State private var blurAmount = 0.0 {
        //Option 1 one won't work, using onChange modifier to fix it
        //Option 2 does work
        didSet {
            print("New value is \(blurAmount)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello World")
                .blur(radius: blurAmount)
            
            //Option 1: when we set the value with slider, the didset{} do not trigger, because the @State is a struct and it wrap the actual value in it. the Slider $blurAmout is a binding that change the actual value direct, so the @State struct never change.
            Slider(value: $blurAmount, in: 0...20)
            
            //Option 2: change the value using a button is fine it goes through the non-mutating setter and therefore triggers the didSet
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}
