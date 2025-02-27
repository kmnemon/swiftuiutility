//
//  FixedSizeModifier.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/9.
//

import SwiftUI


struct FixedSizeModifier: View {
    var body: some View {
        //Example 1: Text warp
        Text("A single line of text, too long to fit in a box.")
            .frame(width: 200, height: 200)
            .border(Color.gray)
        
        //maintain the ideal size of its children ie.Text()
        Text("A single line of text, too long to fit in a box.")
            .fixedSize()
            .frame(width: 200, height: 200)
            .border(Color.gray)
        
        //Example 2: make two text views have the same height
        HStack {
            Text("Forecast")
                .padding()
                .frame(maxHeight: .infinity)
                .background(.yellow)
            Text("The rain in Spain falls mainly on the Spaniards")
                .padding()
                .frame(maxHeight: .infinity)
                .background(.cyan)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}
