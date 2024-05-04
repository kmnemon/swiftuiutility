//
//  LayoutView.swift
//  swiftuiutility
//
//  Created by ke on 4/8/24.
//

import SwiftUI

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
    }
}

#Preview {
    AlignmentView()
}
