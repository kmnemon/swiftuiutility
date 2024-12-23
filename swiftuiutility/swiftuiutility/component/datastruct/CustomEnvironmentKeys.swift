//
//  CustomEnvironmentKeys.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/23.
//

import SwiftUI

/*
 → We need to implement a custom EnvironmentKey as the key for the badge color
 and associate the Color type with the key.
 → We need an extension on EnvironmentValues with a property that lets us get
 and set the value.
 → Optionally, we can provide a helper method on View to easily set the badge
 color for an entire subtree. This lets us hide the custom key and extension, and
 it provides a discoverable API for users.
 */

enum BadgeColorKey: EnvironmentKey {
    static var defaultValue: Color = .blue
}

extension EnvironmentValues {
    var badgeColor: Color {
        get {self[BadgeColorKey.self]}
        set {self[BadgeColorKey.self] = newValue}
    }
}


extension View {
    func badgeColor(_ color: Color)  -> some View {
        environment(\.badgeColor, color)
    }
}

//read out the badge color
struct Badge: ViewModifier {
    @Environment(\.badgeColor) private var badgeColor
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.white)
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
            .background {
                Capsule(style: .continuous)
                    .fill(badgeColor)
            }
    }
}

extension View{
    func badge() -> some View{
        modifier(Badge())
    }
}

//usage
struct CustomEnvironmentKeys: View {
    var body: some View {
        VStack {
            Text(3000, format: .number)
                .badge()
            Text("Test")
                .badge()
        }
        //if we not set the badgeColor it will use the default value .blue
        
        VStack {
            Text(3000, format: .number)
                .badge()
            Text("Test")
                .badge()
        }
        .badgeColor(.orange)
    }
}
