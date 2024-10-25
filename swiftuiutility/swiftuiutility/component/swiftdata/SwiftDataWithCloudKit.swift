//
//  Untitled.swift
//  swiftuiutility
//
//  Created by ke on 10/25/24.
//


//project 58
//1.add icloud
//2.add remote notification
//3.add all object optional or have default value

import SwiftData
//little skill of wrapper
@Model
class Person {
    var name: String?
    var age: Int?
    var roles: [Role]? = [Role]()
    
    var unwrappedRoles: [Role] {
        roles ?? []
    }
    
    
    init(name: String? = nil, age: Int? = nil) {
        self.name = name
        self.age = age
    }
    
}

@Model
class Role {
    var role: String?
    
    init(role: String) {
        self.role = role
    }
}
