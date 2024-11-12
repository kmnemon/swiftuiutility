//
//  GeometryReaderView.swift
//  swiftuiutility
//
//  Created by ke on 4/8/24.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        //1.Geometry Reader
        GeometryReader { proxy in
            Image(.zeldaBotwLogo2X)
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width * 0.8)
        }
        
        //2.containerRelativeFrame not work very well, because it has very precise definition of what constitutes a container, it might be the whole screen, a navigation stack, a list or a scroll View so on, but it won't think a VStack or HStack is a container.
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)
            
            Image(.zeldaBotwLogo2X)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.8
                }
        }
        
        //3.Use GeometryReader solve
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)
            
            GeometryReader { proxy in
                Image(.zeldaBotwLogo2X)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
        
    }
}


#Preview {
    GeometryReaderView()
}
