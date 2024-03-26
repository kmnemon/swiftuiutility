//
//  HapticEffects.swift
//  swiftuiutility
//
//  Created by ke on 3/26/24.
//

import SwiftUI

struct HapticEffects: View {
    @State private var counter = 0
    
    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.increase, trigger: counter)
//        .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
//        .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counter)
        
    }
}

#Preview {
    HapticEffects()
}
