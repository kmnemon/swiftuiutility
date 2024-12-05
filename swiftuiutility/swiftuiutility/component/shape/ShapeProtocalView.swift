//
//  ShapeView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/13.
//

import SwiftUI

extension ShapeProtocalView {
    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            
            return path
        }
    }
    
    struct Arc: Shape {
        let startAngle: Angle
        let endAngle: Angle
        let clockwise: Bool
        
        func path(in rect: CGRect) -> Path {
            let rotationAdjustment = Angle.degrees(90)
            let modifiedStart = startAngle - rotationAdjustment
            let modifiedEnd = endAngle - rotationAdjustment
            
            var path = Path()
            
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
            
            return path
        }
    }
}

//Section 3
extension CGRect {
    subscript(_ point: UnitPoint) -> CGPoint {
        CGPoint(x: minX + width*point.x, y: minY + height*point.y)
    }
}

struct Bookmark: Shape {
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: rect[.topLeading])
            p.addLines([
                rect[.bottomLeading],
                rect[.init(x: 0.5, y: 0.8)],
                rect[.bottomTrailing],
                rect[.topTrailing],
                rect[.topLeading]
            ])
            p.closeSubpath()
        }
    }
    
    func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        var result = proposal.replacingUnspecifiedDimensions()
        let ratio: CGFloat = 2/3
        let newWidth = ratio * result.height
        if newWidth <= result.width {
            result.width = newWidth
        } else {
            result.height = result.width / ratio
        }
        return result
    }
}

struct ShapeProtocalView: View {
    var body: some View {
        Triangle()
        //            .fill(.red)
            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
        
        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
            .stroke(.blue, lineWidth: 10)
            .frame(width: 300, height: 300)
    }
}
