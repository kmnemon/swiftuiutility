//
//  GeometryReaderView.swift
//  swiftuiutility
//
//  Created by ke on 4/8/24.
//

import SwiftUI
/*
 Geometry readers are used to get access to the proposed size
 A geometry reader always accepts the proposed size and
 reports that size to its view builder closure via a GeometryProxy, giving us access to
 the geometry reader’s size. The geometry proxy also lets us access the current safe
 area insets and the frame of the view in a specific coordinate space, and it allows us to
 resolve anchors.
 
 Geometry readers are special among other SwiftUI container views, in that they don’t
 provide an alignment parameter, and they place their subviews top-leading by
 default — whereas all other container views, with the exception of ScrollView, use
 center alignment by default.
 */

struct GeometryReaderView: View {
    var body: some View {
        //0.show proposed size
        GeometryReader { proxy in
            Text("Proposed Size: \(proxy.size)")
        }
        
        
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
