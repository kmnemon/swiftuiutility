//
//  ScenePhaseView.swift
//  swiftuiutility
//
//  Created by ke on 4/8/24.
//

import SwiftUI
/*
 .active - running
 .inactive - still running and might be visible to the user but the user isn't able to access them for some reason,example swipe down partially reveal in the control center
 .background - they are not visible to the user
 */

struct ScenePhaseView: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onChange(of: scenePhase) { oldPhase, newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

#Preview {
    ScenePhaseView()
}
