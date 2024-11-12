//
//  ShareObject.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/12.
//

import SwiftUI

extension ShareObjectView {
    @Observable
    class Player {
        var name = "An"
        var highScore = 0
    }
    
    struct HighScoreView: View {
        var player: Player
        
        var body: some View {
            Text("Your highscore is: \(player.highScore)")
        }
    }
}

struct ShareObjectView: View {
    @State private var player = Player()
    
    var body: some View {
        Text("Welcome")
        HighScoreView(player: player)
    }
}

