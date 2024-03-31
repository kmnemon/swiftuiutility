//
//  Student.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import Foundation
import SwiftData

@Model
class Book {
    var id: UUID
    var name: String
    var genre: String
    var joinDate: Date
    
    init(id: UUID, name: String, genre: String, joinDate: Date) {
        self.id = id
        self.name = name
        self.genre = genre
        self.joinDate = joinDate
    }
}
