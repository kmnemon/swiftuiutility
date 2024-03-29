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
    
    init(id: UUID, name: String, genre: String) {
        self.id = id
        self.name = name
        self.genre = genre
    }
}
