//
//  Lightweight.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/23.
//

/*
 SwiftData will execute lightweight migration automatically for a range of small changes, including:

 1.Adding one or more new models.
 2.Adding one or more new properties that have a default value.
 3.Renaming one or more properties.
 4.Deleting properties from a model.
 5.Adding or removing the .externalStorage or .allowsCloudEncryption attributes.
 6.Adding the .unique attribute and all values for that property are already unique.
 7.Adjusting the delete rule on relationships.
 */

import SwiftData

//example: rename properties
struct LightweightMigration {
    @Model
    class User {
        @Attribute(originalName: "name") var fullName: String

        init(name: String) {
            self.fullName = name
        }
    }
    
    
    
    
}
