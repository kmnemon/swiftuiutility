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
