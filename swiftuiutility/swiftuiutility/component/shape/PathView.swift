//
//  PathView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/13.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        Section("1") {
            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
                path.closeSubpath()
            }
            //        .fill(.blue)
            .stroke(.blue, lineWidth: 10)
        }
        
        /*
        StrokeStyle struct, which gives us control over
        how every line should be connected to the line after it (line join) and how every line should be
        drawn when it ends without a connection after it (line cap)
         */
        Section("2") {
            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
            }
            .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        }
    }
}


#Preview {
    PathView()
}
