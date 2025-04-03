//
//  GeometryReadeDetail.swift
//  swiftuiutility
//
//  Created by ke on 4/3/25.
//

//https://www.youtube.com/watch?v=AXGrYI78hIo

import SwiftUI



struct GeometryReaderDetail: View {
    var body: some View {
        NavigationStack {
            VStack {
                Rectangle()
                    .fill(.teal)
                    .frame(height: 200)
                GeometryReader { proxy in
                    Rectangle()
                        .fill(.green)
                    VStack(alignment: .leading) {
                        Text(proxy.info(space: .local))
                        Text(proxy.info(space: .global))
                        Text(proxy.info(space: .named("VStack")))
                    }
                    Text("Where am I?")
                    //                        .position(x: proxy.frame(in: .local).midX,
                    //                                  y: proxy.frame(in: .local).midY)
                    //.named("VStack) = 360 + 208 + 240
                        .position(x: proxy.frame(in: .local).midX,
                                  y: proxy.frame(in: .named("VStack")).midY)
                    
                }
            }
            .coordinateSpace(name: "VStack")
            .navigationTitle("GeometryReader")
        }
    }
}

