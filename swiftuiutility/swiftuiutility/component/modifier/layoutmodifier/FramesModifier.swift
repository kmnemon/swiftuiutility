//
//  FramesModifier.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/4.
//

import SwiftUI

extension View {
    func proposedWidthOrGreater() -> some View {
        frame(maxWidth: .infinity)
    }
    
    func acceptProposedWidth() -> some View {
        frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct FramesModifier: View {
    var body: some View {
        //1.Fixed Frames - it proposes exactly the specified size to its subview, and it reports exactly the specified size as its own size, independent of the reported size of its subview.
        //.frame(width:height:alignment)
        Text("Hello Fixed Frame")
            .frame(width: 100, height: 100)

        
        //2.Flexible Frames
        //.frame(minimum, maximum, ideal, alignment)
        //Pattern 1:
        /*
         makes sure the flexible frame becomes at least as wide as proposed, or the width of tis subview if that's wider than proposed.This is commonly used to create views that span the entire available width.
         
         The flexible frames API is the only one in SwiftUI to explicitly specify an ideal size,
         i.e. the size that will be adopted if nil is proposed for one or both dimensions. If the
         idealWidth or idealHeight parameters are specified, this size will be proposed to the
         frame’s subview, and it’ll also be reported as the frame’s own size, regardless of the
         size of its subview.
         */
        Text("Hello, Flexible Frames")
            .frame(maxWidth: .infinity)
            .background(.quinary)
        
        //Pattern 2:
        /*
         This makes sure the frame always becomes exactly as wide as proposed,independent of the size of its subview.
         */
        Text("Hello, Flexible Frames")
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(.teal)
        
        
        
        
    }
}
