//
//  AtState.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI

struct ChildBindingView: View {
    //a property warpper allows you to create a two-way connection between a property that stores data and a view changes the data.
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle("RemeberMe2", isOn: $isOn)
    }
}

struct BindingView: View {
    @State private var rememberMe = false
    
    @State private var rememberMe2 = false
    
    var body: some View {
        VStack {
            Toggle("Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
        
        VStack {
            ChildBindingView(isOn: $rememberMe2)
            Text(rememberMe2 ? "On" : "Off")
        }
    }
}

#Preview {
    BindingView()
}


