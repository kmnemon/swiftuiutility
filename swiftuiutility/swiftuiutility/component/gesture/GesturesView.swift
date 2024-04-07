//
//  TapGestureView.swift
//  swiftuiutility
//
//  Created by ke on 4/7/24.
//

import SwiftUI

struct GesturesView: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    @State private var currentAmoutAngle = Angle.zero
    @State private var finalAmountAngle = Angle.zero
    
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        Text("Tap")
            .onTapGesture(count: 2) {
                print("double tapped")
            }
        
        Text("LongPress")
            .onLongPressGesture(minimumDuration: 2) {
                print("long pressed")
            } onPressingChanged: { inProgress in
                print("In progress: \(inProgress)")
            }
        
        Text("magnify")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnifyGesture()
                    .onChanged { value in
                        currentAmount = value.magnification - 1
                    }
                    .onEnded { value in
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
            )
        
        Text("rotation")
            .rotationEffect(currentAmoutAngle + finalAmountAngle)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        currentAmoutAngle = value.rotation
                    }
                    .onEnded { value in
                        finalAmountAngle += currentAmoutAngle
                        currentAmoutAngle = .zero
                    }
            )
        
        VStack {//default child high priority
            Text("child text")
                .onTapGesture {
                    print("Text")
                }
        }
        .onTapGesture {
            print("VStack")
        }
        
        VStack {
            Text("set to higher priority")
                .onTapGesture {
                    print("Text")
                }
        }// set to higher priority
        .highPriorityGesture(
            TapGesture()
                .onEnded {
                    print("VStack")
                }
        )
        
        VStack {
            Text("simultaneous")
                .onTapGesture {
                    print("Text")
                }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    print("VStack")
                }
        )
        
        //sequence
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                     isDragging = true
                }
            }
        let combined = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset()
            .gesture(combined)
    }
}

#Preview {
    GesturesView()
}
