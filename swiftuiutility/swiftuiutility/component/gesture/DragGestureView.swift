//
//  GestureView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/15.
//

import SwiftUI

struct DragGestureView: View {
    @State private var dragAmount = CGSize.zero
    @State private var dragAmount2 = CGSize.zero
    
    let letters = Array("Hello SwiftUI")
    
    @State private var enabled = false
    @State private var dragAmount3 = CGSize.zero
    
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 200, height: 100)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged{ dragAmount = $0.translation }
                    .onEnded{ _ in dragAmount = .zero }
            )
            .animation(.bouncy, value: dragAmount)
        
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 200, height: 100)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount2)
            .gesture(
                DragGesture()
                    .onChanged{ dragAmount2 = $0.translation }
                    .onEnded{ _ in
                        withAnimation(.bouncy){
                            dragAmount2 = .zero
                        }
                    }
            )
        
        
        HStack(spacing: 0){
            ForEach(0..<letters.count, id:\.self){ num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount3)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount3)
            }
        }
        .gesture(
            DragGesture()
                .onChanged{ dragAmount3 = $0.translation }
                .onEnded { _ in
                    dragAmount3 = .zero
                    enabled.toggle()
                }
        )
        
    }
}

#Preview {
    DragGestureView()
}
