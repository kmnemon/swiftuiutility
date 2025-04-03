//
//  GeometryReaderView3.swift
//  swiftuiutility
//
//  Created by ke on 4/8/24.
//

import SwiftUI

/*
 Want to know where this view is on the screen? Use the global space.
 Want to know where this view is relative to its parent? Use the local space.
 What to know where this view is relative to some other view? Use a custom space.
 */
/*
 A global center X of 191 means that the center of the geometry reader is 191 points from the left edge of the screen.
 A global center Y of 440 means the center of the geometry reader is 440 points from the top edge of the screen. This isn’t dead in the center of the screen because there is more safe area at the top than the bottom.
 A custom center X of 191 means the center of the geometry reader is 191 points from the left edge of whichever view owns the “Custom” coordinate space, which in our case is OuterView because we attach it in ContentView. This number matches the global position because OuterView runs edge to edge horizontally.
 A custom center Y of 381 means the center of the geometry reader is 381 points from the top edge of OuterView. This value is smaller than the global center Y because OuterView doesn’t extend into the safe area.
 A local center X of 153 means the center of the geometry reader is 153 points from the left edge of its direct container.
 A local center Y of 350 means the center of the geometry reader is 350 points from the top edge of its direct container.
 */
struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            
            InnerView()
                .background(.green)
            
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            
            GeometryReader { proxy in
                    Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(proxy.frame(in: .global).midX) x \(proxy.frame(in: .global).midY)")
                        print("Custom center: \(proxy.frame(in: .named("Custom")).midX) x \(proxy.frame(in: .named("Custom")).midY)")
                        print("Local center: \(proxy.frame(in: .local).midX) x \(proxy.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            
            Text("Right")
        }
    }
}

struct GeometryReaderView3: View {
    var body: some View {
        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}

#Preview {
    GeometryReaderView3()
}
