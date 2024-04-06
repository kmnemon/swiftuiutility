//
//  VoiceOverView.swift
//  swiftuiutility
//
//  Created by ke on 4/6/24.
//

import SwiftUI

struct VoiceOverView: View {
    let pictures = [
        "zelda-botw-logo_2x"
    ]
    
    let labels = [
        "Breath of the Wild"
    ]
    
    @State private var selectedPicture = 0
    
    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPicture = 0
            }
            .accessibilityLabel(labels[selectedPicture])
            .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
        
        Button{
            selectedPicture = 0
        } label: {
            Image(pictures[selectedPicture])
                .resizable()
                .scaledToFit()
        }
        .accessibilityLabel(labels[selectedPicture])
        
    }
}

#Preview {
    VoiceOverView()
}
