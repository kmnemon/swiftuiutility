//
//  LayoutProtocolRadial.swift
//  swiftuiutility
//
//  Created by ke Liu on 4/11/25.
//

import SwiftUI
/*
 The sizeThatFits() - method is given a proposed size for our layout,
 along with all the subviews that are inside, and must return the actual
 size our container wants to have. (Remember the three-step layout
 process: step 1 is the parent proposing a size, step 2 is the child
 deciding on its actual size, and step 3 is the parent placing the child
 based on that size.)
 
 The placeSubviews() - method is given the actual CGRect the parent
 has allocated for the child, which will match the size we returned from
 sizeThatFits(). It will also be given the original proposed size,
 because it’s possible the parent proposed multiple sizes before one was
 finally chosen, and we’ll also get the subviews ready to place.
 */


struct RadialLayout: Layout {
    /* proposal: ProposedViewSize
     Unspecified: “I don’t have a particular size in mind for you, so tell me your ideal size.”
     Infinity: “You can have as much space as you want, so what’s the most you’ll take?”
     Zero: “Space is really tight, so what’s the least you can work with?”
     */
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) -> CGSize {
        
        proposal.replacingUnspecifiedDimensions()  //return a fully-formed CGSize with no optional width or heigh  – both values will have something meaningful in there, with nil values being replaced by a default of 10
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) {
        let radius = min(bounds.size.width, bounds.size.height) / 2
        let angle = Angle.degrees(360 / Double(subviews.count)).radians
        
        for (index, subview) in subviews.enumerated() {
            let viewSize = subview.sizeThatFits(.unspecified)
            
            let xPos = cos(angle * Double(index) - .pi / 2) * (radius - viewSize.width / 2)
            let yPos = sin(angle * Double(index) - .pi / 2) * (radius - viewSize.height / 2)
            
            let point = CGPoint(x: bounds.midX + xPos, y: bounds.midY + yPos)
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}



struct LayoutProtocolRadial: View {
    @State private var count = 16
    
    var body: some View {
        RadialLayout {
            ForEach(0..<count, id: \.self) { _ in
                Circle()
                    .frame(width: 32, height: 32)
            }
        }
        .safeAreaInset(edge: .bottom) {
            Stepper("Count: \(count)", value: $count.animation(), in: 0...36)
            .padding()
        }
    }
}
