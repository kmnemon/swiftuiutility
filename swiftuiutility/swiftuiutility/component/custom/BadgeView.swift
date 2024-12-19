//
//  BadgeView.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/9.
//

import SwiftUI

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

extension View {
    func badge2<Badge: View>(@ViewBuilder _ badge: () -> Badge) -> some View {
        overlay(alignment: .topTrailing) {
            badge()
                .alignmentGuide(.top) { $0.height/2 }
                .alignmentGuide(.trailing) { $0.width/2 }
        }
    }
}

struct BadgeView: View {
    var body: some View {
        Text("Hello World!")
            .badge {
                Text("2024").font(.caption)
            }
    }
}
