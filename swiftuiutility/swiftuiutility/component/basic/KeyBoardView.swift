//
//  KeyBoardView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/8.
//

import SwiftUI

struct KeyBoardView: View {
    @State private var money = 0.0
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Money", value: $money, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
            }
            .navigationTitle("WeSplit")
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

#Preview {
    KeyBoardView()
}
