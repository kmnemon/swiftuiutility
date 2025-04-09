//
//  EnvironmentValue.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/23.
//

import SwiftUI
/*
 Environment is a SwiftUI built-in technique dependency injection
 */

struct EnvironmentValue: View {
    var body: some View {
        /*
         1. .font modifier after Text is a enum value, absorb by the Text
         */
        Text("Item 1")
            .font(.title)
        
        
        VStack {
            Text("Item 1")
            Text("Item 2")
        }
        .font(.title)
        
        /*
         2. .font modifier after VStack is a syntax for writing a font into the envionment
         */
        VStack {
            Text("Item 1")
            Text("Item 2")
        }
        .environment(\.font, .title) //inject keyPath:Value
    }
}
