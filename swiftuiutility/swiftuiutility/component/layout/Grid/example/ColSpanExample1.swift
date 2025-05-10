//
//  Untitled.swift
//  swiftuiutility
//
//  Created by ke on 5/10/25.
//

import SwiftUI

//Example1
struct ColSpanExample1: View {
    var body: some View {
        let gridItems = [GridItem(.fixed(150), spacing: 10, alignment: .leading),
                         GridItem(.fixed(150), spacing: 10, alignment: .leading),
                         GridItem(.fixed(150), spacing: 10, alignment: .leading)]
        
        LazyVGrid(columns: gridItems, spacing: 10) {
            ForEach(0..<8) { idx in
                Image("tony-1")
                    .resizable()
                    .frame(width: idx == 4 ? 310 : 150, height: 150)
                
                if idx == 4 { Color.clear }
                
            }
        }
        .frame(width: 470)
        
        
        
    }
}

//Same example with helperview
struct ColSpan<Content: View>: View {
    let span: Bool
    let content: () -> Content
    
    init(span: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.span = span
        self.content = content
    }
    
    var body: some View {
        content()
        
        if span { Color.clear }
    }
}

struct ColSpanExample2: View {
    var body: some View {
        let gridItems = [GridItem(.fixed(150), spacing: 10, alignment: .leading),
                         GridItem(.fixed(150), spacing: 10, alignment: .leading),
                         GridItem(.fixed(150), spacing: 10, alignment: .leading)]
        
        LazyVGrid(columns: gridItems, spacing: 10) {
            ForEach(0..<8) { idx in
                ColSpan(span: idx == 4) {
                    Image("tony-1")
                        .resizable()
                        .frame(width: idx == 4 ? 310 : 150, height: 150)
                }
                
            }
        }
        .frame(width: 470)
        
        
        
    }
}
