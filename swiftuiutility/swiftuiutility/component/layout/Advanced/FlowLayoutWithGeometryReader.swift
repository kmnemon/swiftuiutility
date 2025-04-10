//
//  FlowLayoutWithGeometryReader.swift
//  swiftuiutility
//
//  Created by ke on 12/31/24.
//

import SwiftUI

struct ZStackFlowLayout: View {
    @State private var sizes: [CGSize]? = nil
    var containerWidth: CGFloat
    let subviewCount = 5
    
    func subview(for index: Int) -> some View {
        Text("Item \(index)" + String(repeating: "\n", count: index/2))
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(hue: .init(index)/10, saturation: 0.8, brightness: 0.8))
            }
    }
    var body: some View {
        let offsets = sizes.map {
            layout(sizes: $0, containerWidth: containerWidth).map { $0.origin }
        } ?? Array(repeating: .zero, count: subviewCount)
        
        ZStack(alignment: .topLeading) {
            ForEach(0..<subviewCount) { ix in
                subview(for: ix)
                    .fixedSize()
                    .measureSize()
                    .alignmentGuide(.leading) { _ in -offsets[ix].x }
                    .alignmentGuide(.top) { _ in -offsets[ix].y }
            }
        }
        .onPreferenceChange(SizeKey.self) { sizes = $0 }
    }
}


struct FlowLayoutWithGeometryReader: View {
    @State private var containerWidth: CGFloat?
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                let width: CGFloat = proxy.size.width
                Color.clear
                    .onAppearOrChange(of: width) { containerWidth = $0 }
            }
            .frame(height: 0)
            ZStackFlowLayout(containerWidth: containerWidth ?? 0)
                .frame(minWidth: 0, maxWidth: .infinity) // become exactly the proposed width
        }
    }
}
