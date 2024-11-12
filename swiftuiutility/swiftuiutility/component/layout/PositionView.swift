//
//  PositionView.swift
//  swiftuiutility
//
//  Created by ke on 4/8/24.
//

import SwiftUI
//1.absolute position
//2.relative position - offset modifier - if you offset some text it's original Dimenssions don't actually change. it frame doesn't actually change
struct PositionView: View {
    var body: some View {
        Text("absolute position")
            .position(x: 100, y: 100)
            .background(.red)
        
//        Text("relative position")
//            .offset(x: 100, y: 100)
//            .background(.red)    
    }
}

#Preview {
    PositionView()
}
