//
//  KeyboardModifier.swift
//  swiftuiutility
//
//  Created by ke on 2024/9/9.
//

import SwiftUI

struct KeyboardModifier: View {
    @State private var testValue = 0
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        Section("1") {
            TextField("number:", value: $testValue, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .keyboardType(.decimalPad)
        }
        
        Section("2") {
            NavigationStack {
                Form {
                    TextField("number:", value: $testValue, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                .navigationTitle("Title")
                .toolbar {
                    if amountIsFocused {
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    KeyboardModifier()
}
