//
//  HoneycombExample.swift
//  swiftuiutility
//
//  Created by ke on 5/11/25.
//

import SwiftUI

//RegularGrid
struct RegularGrid: View {
    let cols: Int = 6
    let spacing: CGFloat = 10
    let imgsize = CGSize(width: 150, height: 150)
    
    var body: some View {
        let gridItems = Array(repeating: GridItem(.fixed(imgsize.width), spacing: spacing), count: cols)
        
        ScrollView(.vertical) {
            LazyVGrid(columns: gridItems, spacing: spacing) {
                ForEach(0..<200) { idx in
                    Image("tony-1")
                        .resizable()
                        .frame(width: imgsize.width, height: imgsize.height)
                }
            }
        }
    }
}

//extend to
struct HoneycombExample: View {
    let cols: Int = 6
    let spacing: CGFloat = 10
    let imgsize = CGSize(width: 150, height: 150)
    var hexagonWidth: CGFloat { (imgsize.width / 2) * cos(.pi / 6) * 2 }
    
    var body: some View {
        let gridItems = Array(repeating: GridItem(.fixed(hexagonWidth), spacing: spacing), count: cols)
        
        ScrollView(.vertical) {
            LazyVGrid(columns: gridItems, spacing: spacing) {
                ForEach(0..<200) { idx in
                    VStack(spacing: 0) {
                        Image("tony-1")
                            .resizable()
                            .frame(width: imgsize.width, height: imgsize.height)
                            .clipShape(PolygonShape(sides: 6).rotation(Angle.degrees(90)))
                            .offset(x: isEvenRow(idx) ? 0 : hexagonWidth / 2 + (spacing/2))
                    }
                    .frame(width: hexagonWidth, height: imgsize.height * 0.75)
                }
            }
            .frame(width: (hexagonWidth + spacing) * CGFloat(cols-1))
        }
    }
    
    func isEvenRow(_ idx: Int) -> Bool { (idx / cols) % 2 == 0 }
}

struct PolygonShape: Shape {
    var sides: Int
    
    func path(in rect: CGRect) -> Path {
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        var path = Path()
        
        for i in 0..<sides {
            let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180
            
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
            
            if i == 0 {
                path.move(to: pt) // move to first vertex
            } else {
                path.addLine(to: pt) // draw line to next vertex
            }
        }
        
        path.closeSubpath()
        
        return path
    }
}
