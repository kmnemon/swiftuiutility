//
//  EnvironmentTheValue.swift
//  swiftuiutility
//
//  Created by ke Liu on 4/10/25.
//
import SwiftUI

struct UserModelValue {
    var name: String
}

struct UserModelValueKey: EnvironmentKey {
    static let defaultValue: UserModelValue = UserModelValue(name: "default name")
}

extension EnvironmentValues {
    var userModelValueKey: UserModelValue {
        get {
            self[UserModelValueKey.self]
        } set {
            self[UserModelValueKey.self] = newValue
        }
    }
}

struct NestedValue: View {
    @Environment(\.userModelValueKey) var userModel
    
    var body: some View {
        Text(userModel.name)
    }
}

struct EnvironmentCustomValue: View {
    var body: some View {
        NestedValue()
            .padding()
            .environment(\.userModelValueKey, UserModelValue(name: "ke"))
    }
}
