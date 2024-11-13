//
//  ImagePaintView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/13.
//

import SwiftUI

struct ImagePaintView: View {
    var body: some View {
        Text("hello world")
            .frame(width: 300, height: 300)
            .border(.red, width: 30)
        
        Text("hello world")
            .frame(width: 300, height: 300)
            .background(Image(.mashroom))
        
        // This won't work, to fix this using ImagePaint
        Text("hello world")
            .frame(width: 300, height: 300)
//                .border(Image(.mashroom))
        
        Text("hello world")
            .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image(.mashroom), scale: 0.2), width: 50)
        
        Text("hello world")
            .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image(.mashroom), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5),  scale: 0.2), width: 50)
        
        Capsule()
            .strokeBorder(ImagePaint(image: Image(.mashroom), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.3), lineWidth: 20)
            .frame(width: 300, height: 200)
        
    }
}
