//
//  PushButton.swift
//  swiftuiutility
//
//  Created by ke on 10/23/24.
//

import SwiftUI

struct PushButtonView: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.blue]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom)
            .foregroundStyle(.white)
            .clipShape(.capsule)
            .shadow(radius: isOn ? 0 : 5)
    }
}
