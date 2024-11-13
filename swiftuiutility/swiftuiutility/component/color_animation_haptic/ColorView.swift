//
//  ColorView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/9.
//

import SwiftUI

/*Color.red is not pure red, because apple change the way they look base on the environment they are in
to use pure Color you need to use Color(red:green:blue) instead
*/


struct ColorView: View {
    var body: some View {
        Section("1") {
            ZStack {
                Text("Hello, World!")
            }
            .background(.red)
            
            ZStack {
                Text("Hello, World!")
                    .background(.red)
            }
        }
        
        Section("2") {
            ZStack {
                Color.red
                    .frame(width: 100, height: 100)
                Text("your content")
            }
        }
        
        Section("3") {
            ZStack {
                Color.red
                    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 100)
                Text("your content")
            }
        }
        
        Section("swich in light mode and dark mode") {
            ZStack {
                Color.primary
                    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 100)
                Text("your content")
            }
        }
        
        Section("swich in light mode and dark mode") {
            ZStack {
                Color.secondary
                    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 100)
                Text("your content")
            }
            .background(.blue)
        }
        
        Section("this can expand to safe area") {
            ZStack {
                Color(red: 1, green: 0.8, blue: 0)
                Text("your content")
            }
            .ignoresSafeArea()
        }
        
        Section("this can expand to safe area 2") {
            ZStack {
                VStack(spacing: 0) {
                    Color.red
                    Color.blue
                }
                
                Text("your content")
                    .foregroundStyle(.secondary)
                    .padding(10)
                    .background(.ultraThinMaterial)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ColorView()
}
