//
//  CustomComponentStyles.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/24.
//

import SwiftUI

/*
 1. Create a protocol BadgeStyle that defines the interface for a badge style.
 2. Create an environment key for the badge style.
 3. Use the custom badge style within the badge modifier.
 */

//1. generate badgestyle
protocol BadgeStyle {
    associatedtype Body: View
    @ViewBuilder func makeBody(_ label: AnyView) -> Body
}

struct DefaultBadgeStyle: BadgeStyle {
    var color: Color = .red
    func makeBody(_ label: AnyView) -> some View {
        label
            .font(.caption)
            .foregroundColor(.white)
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
            .background {
                Capsule(style: .continuous)
                    .fill(color)
            }
    }
}

//environment key
enum BadgeStyleKey: EnvironmentKey {
    static var defaultValue: any BadgeStyle = DefaultBadgeStyle()
}

//environment values
extension EnvironmentValues {
    var badgeStyle: any BadgeStyle {
        get { self[BadgeStyleKey.self] }
        set { self[BadgeStyleKey.self] = newValue }
    }
}

struct OverlayBadge<BadgeLabel: View>: ViewModifier {
    var alignment: Alignment = .topTrailing
    var label: BadgeLabel
    @Environment(\.badgeStyle) private var badgeStyle
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: alignment) {
                AnyView(badgeStyle.makeBody(AnyView(label)))
                    .fixedSize()
                    .alignmentGuide(alignment.horizontal) { $0[HorizontalAlignment.center] }
                    .alignmentGuide(alignment.vertical) { $0[VerticalAlignment.center] }
            }
    }
}

//helper function to call the badge modifier
extension View {
    func badge<V: View>(alignment: Alignment = .topTrailing,
                        @ViewBuilder _ content: () -> V) -> some View {
        modifier(OverlayBadge(alignment: alignment, label: content()))
    }
}

//2. make custom badge style
struct FancyBadgeStyle: BadgeStyle {
    var background: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(Color.red)
                .overlay {
                    ContainerRelativeShape()
                        .fill(LinearGradient(colors: [.white, .clear],
                                             startPoint: .top, endPoint: .center))
                }
            ContainerRelativeShape()
                .strokeBorder(Color.white, lineWidth: 2)
                .shadow(radius: 2)
        }
    }
    
    func makeBody(_ label: AnyView) -> some View {
        label
            .foregroundColor(.white)
            .font(.caption)
            .padding(.horizontal, 7)
            .padding(.vertical, 4)
            .background(background)
            .containerShape(Capsule(style: .continuous))
    }
}

//helper function set the enviroment
extension View {
    func badgeStyle(_ style: any BadgeStyle) -> some View {
        environment(\.badgeStyle, style)
    }
}

//helper extension to call .badgeStyle(.fancy) instead of .badgeStyle(FancyBadgeStyle())
extension BadgeStyle where Self == FancyBadgeStyle {
    static var fancy: FancyBadgeStyle {
        FancyBadgeStyle()
    }
}



struct CustomComponentStyles: View {
    var body: some View {
        //1. using default badge style
        Text("Test")
            .badge {
                Text(3000, format: .number)
            }
        
        //2. using custom badge style
        HStack {
            Text("Inbox")
            Text("Spam")
                .badge {
                    Text(3000, format: .number)
                }
        }
        .badgeStyle(.fancy)
        
    }
}

