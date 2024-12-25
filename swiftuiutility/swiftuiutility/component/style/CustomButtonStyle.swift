//
//  ButtonStyleModifier.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/24.
//

import SwiftUI

extension CustomButtonStyle {
    struct CustomButtonStyle: ButtonStyle {
        var color: Color
        var pressedColor: Color = .gray
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(configuration.isPressed ? pressedColor : color)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .shadow(radius: 5)
                .scaleEffect(configuration.isPressed ? 0.95 : 1.0) // Adds a slight scaling effect when pressed
                .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
        }
    }
}

struct CustomButtonStyle: View {
    //1. predefine button style
    var body: some View {
        VStack {
            Button("Default Button") {
                print("Default button tapped")
            }
            .buttonStyle(DefaultButtonStyle()) // Default style
            
            Button("Bordered Button") {
                print("Bordered button tapped")
            }
            .buttonStyle(BorderedButtonStyle()) // Bordered style
            
            /*
             Button("Link Button") {
             print("Link button tapped")
             }
             .buttonStyle(LinkButtonStyle()) // Link style
             */
        }
        .padding()
        
        //2. custom button style
        VStack {
            Button("Custom Button") {
                print("Custom button tapped")
            }
            .buttonStyle(CustomButtonStyle(color: .blue)) // Apply custom style
        }
        .padding()
        
    }
}
