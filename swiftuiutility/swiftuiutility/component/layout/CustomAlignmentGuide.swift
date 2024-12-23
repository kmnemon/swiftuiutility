//
//  CustomAlignmentGuide.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/20.
//
import SwiftUI

struct CircleButton: View {
    var symbol: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.secondary)
            
            Image(systemName: symbol)
                .resizable()
                .padding(6)
        }
        .frame(maxWidth: 40, maxHeight: 40)
    }
}


struct MenuAlignment: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context.width/2
    }
}

extension HorizontalAlignment {
    static let menu = HorizontalAlignment(MenuAlignment.self)
}

struct CustomAlignmentGuide: View {
    var body: some View {
        VStack(alignment: .menu) {
            HStack {
                Text("Inbox")
                CircleButton(symbol: "tray.and.arrow.down")
                    .frame(width: 30, height: 30)
                    .alignmentGuide(.menu) {
                        $0.width/2 }
            }
            HStack {
                Text("Sent")
                CircleButton(symbol: "tray.and.arrow.up")
                    .frame(width: 30, height: 30)
                    .alignmentGuide(.menu) { $0.width/2 }
            }
            CircleButton(symbol: "line.3.horizontal")
                .frame(width: 40, height: 40)
        }
    }
}
