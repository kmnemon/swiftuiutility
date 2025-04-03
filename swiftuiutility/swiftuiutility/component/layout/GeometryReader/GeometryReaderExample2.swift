//
//  GeometryReaderExample2.swift
//  swiftuiutility
//
//  Created by ke on 4/3/25.
//

import SwiftUI

struct GeometryReaderExample2: View {
    var imageNames: [String] {
        Array(1...7).map{"tony-\($0)"}
    }
    
    var body: some View {
        GeometryReader { screen in
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(imageNames, id: \.self) { imageName in
                        GeometryReader { geometry in
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: screen.size.width)
                                .offset(x: -geometry.frame(in: .global).origin.x)
                                .clipped()
                            Text(geometry.xOrigin(space: .global))
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .padding(100)
                        }
                        .frame(width: screen.size.width)
                    }
                }
            }
        }
    }
}
