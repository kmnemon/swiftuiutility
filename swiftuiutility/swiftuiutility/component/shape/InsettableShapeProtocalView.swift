//
//  ShapeView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/13.
//

import SwiftUI

extension InsettableShapeProtocalView {
    struct Arc: InsettableShape {
        let startAngle: Angle
        let endAngle: Angle
        let clockwise: Bool
        
        //for insettable shape protocal
        var insetAmount = 0.0
        
        func path(in rect: CGRect) -> Path {
            let rotationAdjustment = Angle.degrees(90)
            let modifiedStart = startAngle - rotationAdjustment
            let modifiedEnd = endAngle - rotationAdjustment
            
            var path = Path()
            
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
            
            return path
        }
        
        //for insettable shape protocal
        func inset(by amount: CGFloat) -> some InsettableShape {
            var arc = self
            arc.insetAmount += amount
            return arc
        }
    }
}

struct InsettableShapeProtocalView: View {
    var body: some View {
        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(.blue, lineWidth: 40) // strokeBorder modifier can be used in InsettableShape
    }
}
