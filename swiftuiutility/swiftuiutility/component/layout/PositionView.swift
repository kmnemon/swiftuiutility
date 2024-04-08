//
//  PositionView.swift
//  swiftuiutility
//
//  Created by ke on 4/8/24.
//

import SwiftUI

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
