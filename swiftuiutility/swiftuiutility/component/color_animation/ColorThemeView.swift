//
//  ColorThemeView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/18.
//

import SwiftUI

extension ShapeStyle where Self == Color{
    static var darkBackground: Color{
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color{
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}

struct ColorThemeView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Image("zelda-botw-logo_2x")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()
                
                VStack{
                    Text("Nintendo game")
                        .font(.headline)
                        .foregroundStyle(.white)
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(.lightBackground)
            }
            .clipShape(.rect(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.lightBackground)
            )
            .navigationTitle("color-theme")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ColorThemeView()
}
