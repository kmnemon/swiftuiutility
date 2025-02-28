//
//  MaximumWidthAndHeight.swift
//  swiftuiutility
//
//  Created by ke on 2025/2/28.
//

import SwiftUI
/*
 Color.red is completely layout neutral
 frame() is completely layout neutral
 Text() is layout neutral for minimum width and minimum height, but cares very much about its ideal width, ideal height, maximum width, and maximum height.
 */


struct SixSizeValuesExample: View {
    @State private var usesFixedSize = false
    
    var body: some View {
        /* Example 1:
         if a child view has a maximum width and height set, and the parent view offers more space than the child's maximum, the child view will ignore the extra space and only take up to its maximum dimensions. The parent view will then center the child view (by default) within the available space.
         */
        // Parent view with a larger frame
        VStack {
            Text("Parent View")
            
            
            // Child view with a maximum width and height
            Text("Child View")
                .frame(maxWidth: 200, maxHeight: 150) // Child's maximum size
                .background(Color.blue.opacity(0.3)) // Visualize child's frame
        }
        .frame(width: 300, height: 300) // Parent's size (larger than child's max)
        .background(Color.yellow.opacity(0.3)) // Visualize parent's frame
        
        /* Example 2:
         The frame then sends its final size up to its parent view, the
         background: it has the 300x200 ideal size we set, but a maximum size
         of whatever the text says it needs, e.g. 95x20.
         */
        Text("Hello World!")
            .frame(idealWidth: 300, idealHeight: 200)
            .background(.red)
        
        /* Example 3:
         switch between layout neutrality and a fixed value by using either a number
         or nil
         */
        VStack {
            Text("Hello, World!")
                .frame(width: usesFixedSize ? 300 : nil)
                .background(.red)
            Toggle("Fixed sizes", isOn:
                    $usesFixedSize.animation())
        }
        
        
    }
}
