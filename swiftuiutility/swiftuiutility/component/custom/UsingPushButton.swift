//
//  UsingPushButton.swift
//  swiftuiutility
//
//  Created by ke on 10/23/24.
//

import SwiftUI

struct UsingPushButton: View {
    @State private var rememberMe: Bool = false
    
    var body: some View {
        PushButtonView(title: "Remember Me", isOn: $rememberMe)
        Text("Remembered: \(rememberMe) ")
    }
}
