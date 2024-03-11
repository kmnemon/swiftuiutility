//
//  ToggleView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/11.
//

import SwiftUI

struct ToggleView: View {
    @State private var agreed = false
    
    var body: some View {
        Toggle("Agree", isOn: $agreed)
    }
}

#Preview {
    ToggleView()
}
