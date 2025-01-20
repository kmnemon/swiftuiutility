//
//  Tire.swift
//  swiftuiutility
//
//  Created by ke on 3/31/24.
//

import Foundation
import SwiftData

@Model
class Tire {
    var name: String
    var brand: Int
    var owner: Car?
    
    init(name: String, brand: Int, owner: Car? = nil) {
        self.name = name
        self.brand = brand
        self.owner = owner
    }
}
