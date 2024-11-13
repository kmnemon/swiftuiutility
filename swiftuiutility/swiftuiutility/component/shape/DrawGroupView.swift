//
//  DrawGroupView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/13.
//

import SwiftUI

//DrawGroup powered by metal, not by core animation
struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                //                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
                //use linearGradient make huge computation
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors:[
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5),
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth:2
                    )
            }
        }
        .drawingGroup() //this tell swiftui it should render the contents of view into an off-screen image
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct DrawGroupView: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
    }
}
