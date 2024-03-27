//
//  AtState.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI

struct BindingView: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle("RemeberMe2", isOn: $isOn)
    }
}

struct AtStateAtBinding: View {
    @State private var rememberMe = false
    
    @State private var rememberMe2 = false
    
    var body: some View {
        VStack {
            Toggle("Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
        
        VStack {
            BindingView(isOn: $rememberMe2)
            Text(rememberMe2 ? "On" : "Off")
        }
    }
}

#Preview {
    AtStateAtBinding()
}
