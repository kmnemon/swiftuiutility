//
//  CardStackModifier.swift
//  swiftuiutility
//
//  Created by ke on 11/9/24.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}


extension CustomModifierView2 {
    struct Card {
        let prompt: String
        static let example = Card(prompt: "who wanna play zelda with wisdom?")
    }
    
    struct CardView: View {
        let card: Card
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .shadow(radius: 10)
                
                
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundStyle(.black)
            }
        }
    }
}

struct CustomModifierView2: View {
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id:\.self) { index in
                        CardView(card: cards[index])
                            .stacked(at: index, in: cards.count)
                    }
                }
            }
        }
    }
}
