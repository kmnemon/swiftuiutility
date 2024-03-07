//
//  FormView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI

struct FormView: View {
    var body: some View {
        Form {
            Section {
                Text("Hello, World!")
            }
             
            Section{
                Text("Hello, World!")
                Text("Hello, World!")
            }
        }
    }
}

#Preview {
    FormView()
}
