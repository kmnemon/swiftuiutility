//
//  EnvironmentView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/12.
//

import SwiftUI


extension EnvironmentView {
    @Observable
    class Player {
        var name = "An"
        var highScore = 0
    }
    
    
    struct HighScoreView: View {
        @Environment(Player.self) var player
        
        var body: some View {
            Text("Your highscore is: \(player.highScore)")
            //*** environment object do not support Binding
            //            Stepper("High score: \(player.highScore)", value: $player.highScore)
            
            //we can fix this by bindable
            @Bindable var player = player
            Stepper("High score: \(player.highScore)", value: $player.highScore)
        }
    }
}

struct EnvironmentView: View {
    @State private var player = Player()
    
    var body: some View {
        VStack {
            Text("Welcome")
            HighScoreView()
        }
        .environment(player) //inject object
    }
}

