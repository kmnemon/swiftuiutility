//
//  ZStackDetailsView.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/9.
//

import SwiftUI
/*
 The two views above are bottom aligned in an HStack. Both have a top-trailing
 aligned badge. The view on the left has an overlay for the badge, so the layout isn’t
 influenced by the size of the badge view. Meanwhile, the view on the right uses a
 ZStack for the badge, and therefore, the bottom of this view is the bottom of the
 badge.
 */

extension View {
    func badgeWithZStack<Badge: View>(@ViewBuilder contents: () -> Badge) -> some View {
        ZStack (alignment: .topTrailing) {
            self
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
    func badgeWithOverlay<Badge: View>(@ViewBuilder contents: () -> Badge) -> some View {
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


struct ZStackDetailsView: View {
    var body: some View {
        HStack(alignment: .bottom) {
            Text("Hello World!")
                .badgeWithOverlay {
                    VStack {
                        Text("a tall badge").font(.caption)
                    }
                    .frame(height: 200)
                }
            
            Text("Hello World!")
                .badgeWithZStack {
                    VStack {
                        Text("a tall badge").font(.caption)
                    }
                    .frame(height: 200)
                }
        }
        .border(.blue)
    }
}
