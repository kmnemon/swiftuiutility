//
//  EnvironmentCustom.swift
//  swiftuiutility
//
//  Created by ke Liu on 4/9/25.
//

import SwiftUI

struct FormElementIsRequiredKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var required: Bool {
        get {
            self[FormElementIsRequiredKey.self]
        } set {
            self[FormElementIsRequiredKey.self] = newValue
        }
    }
}

struct RequirableTextField: View {
    @Environment(\.required) var required
    let title: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField(title, text: $text)
            
            if required {
                Image(systemName: "asterisk")
                    .imageScale(.small)
                    .foregroundStyle(.red)
            }
        }
    }
}

struct EnvironmentCustom: View {
    @State private var firstName = ""

    var body: some View {
        Form {
            RequirableTextField(title: "First Name", text: $firstName)
                .environment(\.required, true)
        }
    }
}
