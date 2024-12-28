//
//  CombinedTransition.swift
//  swiftuiutility
//
//  Created by ke on 12/28/24.
//

import SwiftUI


struct CombinedTransition: View {
    @State private var flag = false
    
    var body: some View {
        Button("tap") {
            withAnimation { flag.toggle() }
        }
        .padding(60)
        
        if flag {
            Rectangle()
                .frame(width: 100, height: 100)
                .transition(
                    .asymmetric(insertion: .slide, removal: .scale)
                    .combined(with: .opacity)
                )
        }
        
        //For iOS 17 new API
        /*
         Inside a custom transition definition, we can also use the TransitionPhase to
         distinguish between insertion, identity, and removal instead of creating an
         asymmetric transition.
         */
        if flag {
            Rectangle()
                .frame(width: 100, height: 100)
                .transition(
                    AsymmetricTransition(insertion: .slide, removal: .scale)
                        .combined(with: .opacity)
                )
        }
    }
}
