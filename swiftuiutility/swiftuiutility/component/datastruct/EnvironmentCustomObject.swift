//
//  EnvironmentTheObject.swift
//  swiftuiutility
//
//  Created by ke Liu on 4/10/25.
//

import SwiftUI

@Observable
final class UserModelObject {
    var name: String
    
    init() {
        self.name = "default name"
    }
    
    init(name: String) {
        self.name = name
    }
}

struct UserModelObjectKey: EnvironmentKey {
    static let defaultValue: UserModelObject = UserModelObject()
}

extension EnvironmentValues {
    var userModelObjectKey: UserModelObject {
        get {
            self[UserModelObjectKey.self]
        } set {
            self[UserModelObjectKey.self] = newValue
        }
    }
}

struct NestedObject: View {
    @Environment(\.userModelObjectKey) var userModel
    
    var body: some View {
        Text(userModel.name)
    }
}

struct EnvironmentCustomObject: View {
    var body: some View {
        NestedObject()
            .padding()
            .environment(\.userModelObjectKey, UserModelObject(name: "ke"))
    }
}
