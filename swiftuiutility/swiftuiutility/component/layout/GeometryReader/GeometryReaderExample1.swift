//
//  GeometryReaderExample1.swift
//  swiftuiutility
//
//  Created by ke on 4/3/25.
//

import SwiftUI

struct GeometryReaderExample1: View {
    @State private var numImages: Double = 7
    
    var imageNames: [String] {
        Array(1...Int(numImages)).map { "tony-\($0)"}
    }
    
    var body: some View {
        VStack {
            Slider(value: $numImages, in: 1...7, step: 1.0)
            GeometryReader { geometry in
                let minCellWidth: CGFloat = geometry.size.width / 4
                let maxCellWidth: CGFloat = geometry.size.width /
                CGFloat(imageNames.count)
                let optimalCellWidth = max(minCellWidth, maxCellWidth)
                let numberOfColumns = Int(geometry.size.width / optimalCellWidth)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: numberOfColumns)) {
                    ForEach(imageNames, id: \.self) { name in
                        Image(name)
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .border(.black)
                    }
                }
            }
        }
        .padding()
    }
}
