//
//  VoiceInputView.swift
//  swiftuiutility
//
//  Created by ke on 4/6/24.
//

import SwiftUI

struct VoiceInputView: View {
    var body: some View {
        Button("John Fitzgerald Kennedy") {
            print("Buuton tapped")
        }
        .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
    }
}

#Preview {
    VoiceInputView()
}
