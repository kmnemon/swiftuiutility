	//
//  LayoutView.swift
//  swiftuiutility
//
//  Created by ke on 4/8/24.
//

import SwiftUI
/*
 1.Alignment works in two directions. eg. .frame .overlay .background .ZStack
 2.Alignment works in horizontal. eg. .VStack
 3.Alignment works in vertical. eg. .HStack
 Note that the Alignment type isn’t the alignment guide. Instead, it’s what determines which alignment guide to use.
 The HorizontalAlignment and VerticalAlignment structs have static constants for the built-in alignment guides:
 1.horizontal direction - .leading, .center, .trailing
 2.vertical direction - .top, .center, .bottom, .firstTextBaseline, .lastTextBaseline
 compositeAlignment - .topLeading, .bottomTrailing
 
 some phrases:
 1.alignment guides - the point which the subview use it to aligment in the container, also called alignment point. eg. the container has size (100 * 50), the center alignment guides is (50 * 25)
 2.subview's origin - subview2 substract subview1's alignment point. eg. subview1 size(50 * 50), alignment point is (25 * 25), subview2 size(100 * 20), alignment point is (50 * 10), the subview2's origin relative to the subview1 is (25,25) - (50,10) = (-25,15).
 3.frames of each subview - the frame is the combination of the subview's origin and size
 */

struct AlignmentView: View {
    var body: some View {
        Text("Live long and prosper")
            .frame(width: 200, height: 100, alignment: .topLeading)
            .background(.blue)
        
        HStack(alignment: .lastTextBaseline) {
            Text("Live")
                .font(.caption)
            
            Text("long")
            
            Text("and")
                .font(.title)
            
            Text("prospect")
                .font(.largeTitle)
        }
        
        VStack(alignment: .leading) {
            Text("Hello, world!")
                .alignmentGuide(.leading) { dimension in
                    dimension[.trailing]
                }
            Text("This is a longer line of text")
        }
        .background(.red)
        .frame(width: 400, height: 200)
        .background(.blue)
        
        VStack(alignment: .leading) {
            ForEach(0..<4) { postion in
                Text("Number \(postion)")
                    .alignmentGuide(.leading) { _ in
                            Double(postion) * -10
                    }
            }
        }
        .background(.red)
        .frame(width: 300, height: 200)
        .background(.blue)
        
        //right-aligned text option1
        HStack {
            Spacer()
            Text("Some right-aligned text")
        }
        
        //right-aligned text option2 is prefered, because the Space has a default minimum length(equal to the default spacing). As a result, the ttext might start wrapping or truncating sooner than necessary,because the Spacer also occupies some of the proposed width of the HStack.
        Text("Some right-aligned text")
            .frame(maxWidth:.infinity, alignment: .trailing)
    }
}

#Preview {
    AlignmentView()
}
