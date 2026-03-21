//
//  CardView.swift
//  SwiftArchitecture
//
//  Created by ke Liu on 3/21/26.
//

import SwiftUI

//4. using the ViewBuilder

//1. Define what type of view you want the content to be.
struct CardView<Content: View>: View {
    let title: String

    //2. Create the property that will represent the closure.
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        GroupBox {
            Text(title)
            Divider()
        }
        .font(.title.weight(.bold).width(.compressed))
        
        //3. Embed the content (views) passed in. Any container view will work, such as a VStack, HStack, etc.
        VStack(content: content)
            .padding()
    }
}

#Preview {
    CardView(title: "Preview Title") {
        Text("Here is some content")
        Text("Here is some MORE content")
    }
}
