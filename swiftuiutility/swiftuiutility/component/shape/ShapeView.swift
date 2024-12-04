//
//  ShapeView.swift
//  swiftuiutility
//
//  Created by ke on 11/9/24.
//

import SwiftUI

/*
 Shapes will accept any proposed size from zero to infinity and fill the available space.
 Circle is an exception, it'll fit itself into any proposed size and report back the actual size of the circle.
 If we propose nil to the shape(i.e. if we wrap it in a .fixedSize), it takes on a default size of 10*10.
 */

public struct ShapeView: View {
    public var body: some View {
        Rectangle()
            .fill(.blue)
            .frame(width: 300, height: 300)
        
        Circle()
            .stroke(.blue, lineWidth: 40)
        
        Circle()
            .strokeBorder(.blue, lineWidth: 40)
        
        RoundedRectangle(cornerRadius: 25)
            .fill(.white)
            .shadow(radius: 10)
        
        Capsule()
            .stroke(.blue, lineWidth: 4)
        
        Ellipse()
            .stroke(.blue, lineWidth: 4)
    }
}
