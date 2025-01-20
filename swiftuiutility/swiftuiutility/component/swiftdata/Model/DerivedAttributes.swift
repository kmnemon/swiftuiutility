//
//  DerivedAttributes.swift
//  swiftuiutility
//
//  Created by ke on 1/20/25.
//

//https://www.hackingwithswift.com/quick-start/swiftdata/how-to-create-derived-attributes-with-swiftdata

import SwiftData
import Foundation

//example 1: in Core Data it was common to use derivations like @count or @sum, so we can implement these by hand
@Model
class SchoolA1 {
    var students: [StudentA1]

    var studentCount: Int {
        students.count
    }

    init(students: [StudentA1]) {
        self.students = students
    }
}

@Model
class StudentA1 {
    var name: String

    init(name: String) {
        self.name = name
    }
}


//example 2: this code creates a Player class with a lastModified property, along with an update() method that can adjust any value while also changing lastUpdated to the current date and time
@Model class PlayerA2 {
    var name: String
    var score: Int
    var lastModified: Date

    init(name: String, score: Int) {
        self.name = name
        self.score = score
        self.lastModified = .now
    }

    func update<T>(keyPath: ReferenceWritableKeyPath<PlayerA2, T>, to value: T) {
        self[keyPath: keyPath] = value
        lastModified = .now
    }
}
