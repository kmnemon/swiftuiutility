//
//  PropertyWrapperStruct.swift
//  swiftuiutility
//
//  Created by ke on 4/6/24.
//

import SwiftUI

extension PropertyWrapperStruct {
    @propertyWrapper
    struct NonNegative<Value: BinaryInteger> {
        var value: Value
        
        init(wrappedValue: Value) {
            if wrappedValue < 0 {
                value = 0
            } else {
                value = wrappedValue
            }
        }
        
        var wrappedValue: Value {
            get { value }
            set {
                if newValue < 0 {
                    value = 0
                } else {
                    value = newValue
                }
            }
        }
    }
    
    struct User {
        @NonNegative var score = 0
    }
    
}

struct PropertyWrapperStruct: View {
    @State private var user = User()
    
    var body: some View {
        Button("Add 10") {
            user.score += 10
        }
        .padding()
        
        Button("Minus 10") {
            user.score -= 10
        }
        .padding()
        
        Text("\(user.score)")
    }
}

#Preview {
    PropertyWrapperStruct()
}
