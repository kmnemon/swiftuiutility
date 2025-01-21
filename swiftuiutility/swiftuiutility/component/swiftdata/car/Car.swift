//
//  Car.swift
//  swiftuiutility
//
//  Created by ke on 3/31/24.
//

import Foundation
import SwiftData

@Model
class Car {
    var id: UUID
    var name: String
    var type: String
    var joinDate: Date
    //.cascade, which means deleting a Car should automaticllay delete all their Tire objects
    @Relationship(deleteRule: .cascade) var tires = [Tire]()
    
    init(id: UUID, name: String, type: String, joinDate: Date) {
        self.id = id
        self.name = name
        self.type = type
        self.joinDate = joinDate
    }
}
