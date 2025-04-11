//
//  PerformanceDiagnose.swift
//  swiftuiutility
//
//  Created by ke on 11/30/24.
//

import SwiftUI

extension Color {
    static var random: Color {
        [.red, .blue, .green, .yellow, .orange].randomElement()!
    }
}


struct PerformanceDiagnose: View {
    var body: some View {
        //1.print in the body see which view is render
        let _ = print("PerformanceDiagnose render")
        
        //2.Setting a random background color is a great way to detect an accidental SwiftUI loop. The tricky part is understanding what triggers the loop tho.
        VStack {
            
        }
        .background(Color.random)
        
        //To find out why a view’s body was reexecuted, we can use the Self._printChanges() API in the view body
        /*
         1. If the view was rerendered due to a state change, the name of the state
         property will be logged in its underscored form.
         2. If the view value itself has changed, i.e. if the value of one of the view’s
         properties has changed, "@self" will be logged.
         3. If the identity of the view has changed, "@identity" will be logged. In practice,
         this usually means the view was freshly inserted into the render tree.
         */
        let _ = Self._printChanges()
    }
}
