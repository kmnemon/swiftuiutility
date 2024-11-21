//
//  OnDisappearModifier.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/21.
//

import SwiftUI

extension OnDisappearModifier {
    struct SecondView: View {
        var body: some View {
            VStack {
                Text("Second View")
            }
            .onDisappear(perform: printHello)
        }
        
        func printHello() {
            print("Hello")
        }
    }
}


struct OnDisappearModifier: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tab Me") {
                SecondView()
            }
        }
    }
}
