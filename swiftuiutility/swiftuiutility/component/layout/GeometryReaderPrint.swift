//
//  GeometryReaderPrint.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/31.
//

import SwiftUI
/*
1. The origin within the global coordinate space is (167, 438). This is the distance from the top-leading edge of the screen.

2. The origin within the local coordinate space is (0, 0). Local always means local to the view, which in this case is the geometry reader, which is the same coordinate space as the second text label (not the container).

3. The origin within the stack is (0, 20), as the view with the geometry reader is the stack’s second subview.
 */

extension CGRect {
    var asString: String {
        return "Rect(x: \(origin.x), y: \(origin.y), w: \(size.width), h: \(size.height))"
    }
}


struct GeometryReaderPrint: View {
    var body: some View {
        VStack {
            Text("Hello")
            Text("Second")
                .overlay {
                    GeometryReader { proxy in
                        let _ = print([
                            proxy.frame(in: .global).asString,
                            proxy.frame(in: .local).asString,
                            proxy.frame(in: .named("Stack")).asString
                        ].joined(separator: "\n"))
                        Color.clear
                        
                    }}
            
        }
        .coordinateSpace(name: "Stack")
    }
}
