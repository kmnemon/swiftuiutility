//
//  ModelExample.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/20.
//

import SwiftData

//example 1: simple model
@Model
class EmployeeA1 {
    var name: String
    var emailAddress: String

    init(name: String, emailAddress: String) {
        self.name = name
        self.emailAddress = emailAddress
    }
}

//example 2: one to one relationship
@Model
class EmployeeA2 {
    var name: String
    var emailAddress: String
    var manager: EmployeeA2?

    init(name: String, emailAddress: String, manager: EmployeeA2?) {
        self.name = name
        self.emailAddress = emailAddress
        self.manager = manager
    }
}

//example 3: add special attributes - every employee must have a unique email address
/*
 be careful:
 the .unique attribute have two side effects
 1. Unique attributes are not supported by CloudKit, and if you attempt to use them your model container will simply refuse to load.
 2. If you create an object using a unique value, then attempt to create a second object using the same unique value, SwiftData will detect this and perform an upsert rather than an insert.
 
 Upserts are SwiftData’s way of trying to honor your request for uniqueness, but also to ensure no data is lost: rather than trying to insert a duplicate value for the unique property, SwiftData instead locates the existing object with that unique property, and updates its other properties to match the values you attempted to insert.

 So, using our credit card example the following might happen:

1. We create a new credit card using the number 1234.
2. We set the balance that to be $1000.
3. We create a second credit card using the number 1234.
4. We set the balance of that to be $0.
SwiftData will not allow us to have two credit cards with the same number, because we marked that attribute as unique, so instead when that code finishes we’ll have just one card with a balance of $0 – the most recent value.
 
 */



@Model
class EmployeeA3 {
    var name: String
    @Attribute(.unique) var emailAddress: String

    init(name: String, emailAddress: String) {
        self.name = name
        self.emailAddress = emailAddress
    }
}
