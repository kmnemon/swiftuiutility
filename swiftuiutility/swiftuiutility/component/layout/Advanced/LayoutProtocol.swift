//
//  LayoutProtocol.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/30.
//

import SwiftUI

extension Array where Element == CGRect {
    func union() -> CGRect {
        guard !self.isEmpty else { return .zero }
        return self.reduce(self.first!) { $0.union($1) }
    }
}

func layout( sizes: [CGSize],
             spacing: CGSize = .init(width: 10, height: 10),
             containerWidth: CGFloat) -> [CGRect] {
    var result: [CGRect] = []
    var currentPosition: CGPoint = .zero
    
    func startNewline() {
        if currentPosition.x == 0 { return }
        currentPosition.x = 0
        currentPosition.y = result.union().maxY + spacing.height
    }
    
    for size in sizes {
        if currentPosition.x + size.width > containerWidth {
            startNewline()
        }
        result.append(CGRect(origin: currentPosition, size: size))
        currentPosition.x += size.width + spacing.width
    }
    
    return result
}

struct FlowLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let containerWidth = proposal.replacingUnspecifiedDimensions().width
        let sizes = subviews.map { $0.sizeThatFits(.unspecified)
        }
        
        return layout(sizes: sizes, containerWidth: containerWidth).union().size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let frames = layout(sizes: subviewSizes, containerWidth: bounds.width)
        for (f, subview) in zip(frames, subviews) {
            let offset = CGPoint(x: f.origin.x + bounds.minX, y: f.origin.y + bounds.minY)
            subview.place(at: offset, proposal: .unspecified)
        }
    }
}

//extension Color {
//    static func random() -> Color {
//        // Generate random values for RGB components (each between 0 and 1)
//        let red = Double.random(in: 0...1)
//        let green = Double.random(in: 0...1)
//        let blue = Double.random(in: 0...1)
//
//        return Color(red: red, green: green, blue: blue)
//    }
//}

struct LayoutProtocol: View {
    
    var body: some View {
        FlowLayout {
            ForEach(Array(0...10), id: \.self) { idx in
                Rectangle()
                    .fill(Color.random)
                    .frame(width: .random(in: 10...35))
            }
        }
        .border(.blue)
        .frame(width: 125)
        .border(.black)
    }
}
