//
//  Untitled.swift
//  swiftuiutility
//
//  Created by ke on 2025/2/26.
//

import SwiftUI


struct AlignmentView2: View {
    var body: some View {
        //Example1:
        //A large image that extends beyond the edges of the screen, with text alignment that causes the text to be placed off-screen as well.
        VStack(alignment: .leading) {
            Image(.mashroom)
            Text("Hello World! This is a layout test.")
        }
        
        //Resolved:
        //wrap it in a frame with a completely flexible width
        VStack(alignment: .leading) {
            Image(.mashroom)
                .frame(minWidth: 0, maxWidth: .infinity)
            Text("Hello World! This is a layout test.")
        }
        
        
        
    }
}
