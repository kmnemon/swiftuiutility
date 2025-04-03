//
//  GeometryReader2View.swift
//  swiftuiutility
//
//  Created by ke on 4/8/24.
//

import SwiftUI

struct GeometryReaderView2: View {
    var body: some View {
        VStack{
            GeometryReader { proxy in
                Text("Hello, World!")
                    .frame(width: proxy.size.width * 0.9)
                    .background(.red)
            }
            .background(.green)
            
            Text("More text")
                .background(.blue)
        }
    }
}

#Preview {
    GeometryReaderView2()
}
