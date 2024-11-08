//
//  TextFieldView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/8.
//

import SwiftUI

struct TextFieldView: View {
    @State private var name = ""
    @State private var checkAmount = 0.0
    @State private var emailAddress = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Enter your name", text: $name)
                    .textInputAutocapitalization(.never)
                Text("Your name is \(name)")
            }
            
            Section {
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            
            Section("textContentType") {
                Form {
                    TextField("Name", text: $name)
                        .textContentType(.name)
                    
                    TextField("Email Address", text: $emailAddress)
                        .textContentType(.emailAddress)
                }
            }
        }
    }
}

#Preview {
    TextFieldView()
}
