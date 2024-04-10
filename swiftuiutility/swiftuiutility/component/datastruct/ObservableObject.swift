//
//  ObservableObject.swift
//  swiftuiutility
//
//  Created by ke on 4/10/24.
//

import SwiftUI

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
    var player: Player
    @Environment(Player.self) var player2
    
    var body: some View {
        @Bindable var player2 = player2
        
        Text("You high score: \(player.highScore)")
        Stepper("High score: \(player2.highScore)",value: $player2.highScore)
    }
}


struct ObservableObject: View {
    @State private var player = Player()
    
    var body: some View {
        VStack {
            Text("Welcome!")
            HighScoreView(player: player)//1.old way
        }
        .environment(player) //2.inject
    }
}

#Preview {
    ObservableObject()
}
