//
//  FaceIDView.swift
//  swiftuiutility
//
//  Created by ke on 4/5/24.
//

import SwiftUI
import LocalAuthentication

/*
 pass the rouch ID request text in code
 pass the face ID request text in Project options
 the reason only A pple knows -_- (69)
 */
 
struct FaceIDTouchIDView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason ) { success, authenticationError in
                if success {
                    isUnlocked = true
                } else {
                    
                }
            }
        } else {
            
        }
    }
}

#Preview {
    FaceIDTouchIDView()
}
