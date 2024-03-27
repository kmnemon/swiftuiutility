//
//  Student.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import Foundation
import SwiftData

@Model
class StudentData {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
