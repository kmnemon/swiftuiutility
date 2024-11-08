//
//  OnAppearModifier.swift
//  swiftuiutility
//
//  Created by ke on 11/7/24.
//

import SwiftUI
/*
 body View run first, OnAppear run after body View
 if you want run some function before the body View use init func
 */
struct OnAppearModifier: View {
    var body: some View {
        VStack {
            Text("Hello World")
        }
//        .onAppear(perform: printMessage)
        .onAppear() {
            print("welcome")
        }
    }
    
    func printMessage() {
        print("welcome")
    }
}
