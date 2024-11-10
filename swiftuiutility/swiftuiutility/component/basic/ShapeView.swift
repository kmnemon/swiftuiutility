//
//  ShapeView.swift
//  swiftuiutility
//
//  Created by ke on 11/9/24.
//

import SwiftUI

public struct ShapeView: View {
    public var body: some View {
        Rectangle()
            .fill(.blue)
            .frame(width: 300, height: 300)
        
        
        Circle()
            .fill(.red)
            .frame(width: 300, height: 300)
        
        
        RoundedRectangle(cornerRadius: 25)
            .fill(.white)
            .shadow(radius: 10)
    }
}
