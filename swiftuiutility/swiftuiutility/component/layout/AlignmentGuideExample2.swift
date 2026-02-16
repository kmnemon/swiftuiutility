//
//  AlignmentGuideExample2.swift
//  swiftuiutility
//
//  Created by ke Liu on 2/13/26.
//

import SwiftUI

//example 1:
struct AlignmentGuideExample2: View {
    var body: some View {
        let image = Image(systemName: "pencil.circle.fill")
            .alignmentGuide(.top, computeValue: { dimension in
                dimension.height / 2
            })
        
        HStack(alignment: .top) {
            Text("Large")
                    .font(.largeTitle)
                    .border(.red)
            image
                .border(.black)
            Text("Pencil")
                .border(.blue)
        }
    }
}

//example2:
struct AlignmentGuideExample3: View {
    var body: some View {
        let image = Image(systemName: "pencil.circle.fill")
            .alignmentGuide(.top, computeValue: {
                $0[VerticalAlignment.bottom]
            })
        
        HStack(alignment: .top) {
            Text("Large")
                    .font(.largeTitle)
                    .border(.red)
            image
                .border(.white)
            Text("Pencil")
                .border(.blue)
        }
    }
    
}
