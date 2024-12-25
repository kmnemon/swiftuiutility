//
//  CustomButtonStyle.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/25.
//

import SwiftUI

extension CustomButtonStyle2 {
    struct CustomButtonStyle: ButtonStyle {
        @Environment(\.isEnabled) var isEnabled
        
        func makeBody(configuration: Configuration) -> some View {
            HStack {
                Spacer()
                configuration.label
                Spacer()
            }
            .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
            .font(.system(.title2, design: .rounded).bold())
            .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
            .foregroundColor(configuration.role == .destructive ? .red : .yellow)
            .background {
                Capsule()
                    .stroke(configuration.role == .destructive ? .red : .yellow, lineWidth: 2)
            }
            .opacity(configuration.isPressed ? 0.5 : 1)
            .saturation(isEnabled ? 1 : 0)
        }
    }
}

struct CustomButtonStyle2: View {
    var body: some View {
        VStack(spacing: 16) {
            Button(role: .destructive) {
                // Delete
            } label: {
                Label("Delete", systemImage: "trash")
            }
            Button("Cancel", role: .cancel) {
                // Cancel Deletion
            }
            
            Button("Submit") {
                // Submit Deletion
            }
            .disabled(true)
        }
        .buttonStyle(CustomButtonStyle())
    }
}
