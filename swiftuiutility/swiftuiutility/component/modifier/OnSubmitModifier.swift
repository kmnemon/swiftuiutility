//
//  OnSubmitModifier.swift
//  swiftuiutility
//
//  Created by ke Liu on 3/21/26.
//

import SwiftUI

struct OnSubmitModifier: View {
    @State private var name = ""
    @State private var continueOnboarding = false
    
    var body: some View {
        TextField("name", text: $name)
            .textFieldStyle(.roundedBorder)
            .padding()
            .submitLabel(.continue)
            .onSubmit {
                continueOnboarding = true
            }
    }
}
