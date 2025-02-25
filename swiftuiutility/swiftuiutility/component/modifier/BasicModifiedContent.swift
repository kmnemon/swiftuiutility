//
//  BasicModifiedContent.swift
//  swiftuiutility
//
//  Created by ke on 2025/2/25.
//

import SwiftUI

extension BasicModifiedContent {
    struct CustomFont: ViewModifier {
        func body(content: Content) -> some View {
            content.font(.largeTitle)
        }
    }
}

struct BasicModifiedContent: View {
    var body: some View {
        Text("Hello")
            .modifier(CustomFont())
        
        //in background SwiftUI using ModifiedContent Object
        ModifiedContent(content: Text("Hello"), modifier: CustomFont())
    }
}
