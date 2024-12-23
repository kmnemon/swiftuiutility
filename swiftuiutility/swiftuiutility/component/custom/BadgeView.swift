//
//  BadgeView.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/9.
//

import SwiftUI

//Badge 1
extension View {
    func badge<Badge: View>(@ViewBuilder contents: () -> Badge) -> some View {
        self.overlay(alignment: .topTrailing) {
            contents()
                .padding(3)
                .background {
                    RoundedRectangle(cornerRadius: 5).fill(.teal)
                }
                .fixedSize()
        }
    }
}

//Badge 2
extension View {
    func badge2<Badge: View>(@ViewBuilder _ badge: () -> Badge) -> some View {
        overlay(alignment: .topTrailing) {
            badge()
                .alignmentGuide(.top) { $0.height/2 }
                .alignmentGuide(.trailing) { $0.width/2 }
        }
    }
}

//Badge 3
struct Badge3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(.white)
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
            .background {
                Capsule(style: .continuous)
                    .fill(.tint)
            }
    }
}

struct BadgeView: View {
    var body: some View {
        Text("Hello World!")
            .badge {
                Text("2024").font(.caption)
            }
        
        Text(3000, format: .number)
            .modifier(Badge3())
            .tint(.red)
    }
}
