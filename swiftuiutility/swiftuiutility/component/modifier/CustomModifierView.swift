//
//  CustomModifier.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/11.
//

import SwiftUI

struct Title: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View{
    func titleStyle() -> some View{
        modifier(Title())
    }
}

struct Watermark: ViewModifier{
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing){
            content
            
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View{
    func watermarked(with text: String) -> some View{
        modifier(Watermark(text: text))
    }
}

struct CustomModifierView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .modifier(Title())
        
        Text("what")
            .titleStyle()
        
        Color.blue
            .frame(width: 200, height: 200)
            .watermarked(with: "hello world")
    }
}

#Preview {
    CustomModifierView()
}
