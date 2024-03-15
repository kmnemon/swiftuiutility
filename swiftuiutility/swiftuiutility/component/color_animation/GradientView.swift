//
//  GradientView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/9.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        Section("1a") {
            LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
        }
        
        Section("1b") {
            LinearGradient(stops: [
                Gradient.Stop(color: .white, location: 0.45),
                Gradient.Stop(color: .black, location: 0.55)
            ], startPoint: .top, endPoint: .bottom)
        }
        
        Section("1c") {
            LinearGradient(stops: [
                .init(color: .white, location: 0.45),
                .init(color: .black, location: 0.55)
            ], startPoint: .top, endPoint: .bottom)
        }
        
        Section("2a") {
            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
        }
        
        Section("2b") {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: .red, location: 0.3)
            ], center: .top, startRadius: 20, endRadius: 70)
        }
        
        Section("3") {
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
        }
        
        Section("4") {
            Text("yoour content")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .foregroundStyle(.white)
                .background(.red.gradient)
        }
    }
}

#Preview {
    GradientView()
}
