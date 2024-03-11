//
//  ButtonView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI

struct ButtonView: View {
    @State var tapCount = 0
    @State private var useRedText = false
    
    var body: some View {
        VStack {
            Button("Tap Count: \(tapCount)") {
                self.tapCount += 1
            }
            
            Button("Delete selection", role: .destructive, action: executeDelete)
            
            Button("Button1") {}
                .buttonStyle(.bordered)
            
            Button("Button2", role: .destructive) {}
                .buttonStyle(.bordered)
            
            Button("Button3") {}
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
            
            Button("Button4", role: .destructive) {}
                .buttonStyle(.borderedProminent)
            
            Button {
                print("button was tapped")
            } label: {
                Text("Tap me")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
            Button {
                print("button was tapped")
            } label: {
                Image(systemName: "pencil.circle")
            }
            
            Button("Edit", systemImage: "pencil") {
                print("button was tapped")
            }
            
            Button {
                print("button was tapped")
            } label: {
                HStack {
                    Image(systemName: "pencil.circle")
                    Text("Edit")
                }
            }
            
            Button {
                print("button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
            Button("red or blud"){
                useRedText.toggle()
            }
            .foregroundStyle(useRedText ? .red : .blue)
        }
    }
    
    func executeDelete() {
        print("Now deleting...")
    }
}

#Preview {
    ButtonView()
}
