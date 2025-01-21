//
//  RS.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/21.
//
import SwiftData

struct RSImplicit {}
struct RSExplicit {}
struct RSExplicit2 {}
struct RSDelete {}
struct RSDelete1 {}
struct RSDelete2 {}
struct RSDelete3 {}
struct RSMaxMin {}

extension RSImplicit {
    //example 1: implicit rs
    @Model
    class School {
        var name: String
        var students: [Student]
        
        init(name: String, students: [Student]) {
            self.name = name
            self.students = students
        }
    }
    
    @Model
    class Student {
        var name: String
        var school: School?
        
        init(name: String, school: School) {
            self.name = name
            self.school = school
        }
    }
}

extension RSExplicit {
    //example 2: explicit rs
    @Model
    class School {
        var name: String
        var students: [Student]
        
        init(name: String, students: [Student]) {
            self.name = name
            self.students = students
        }
    }
    
    @Model
    class Student {
        var name: String
        @Relationship(inverse: \School.students) var school: School
        
        init(name: String, school: School) {
            self.name = name
            self.school = school
        }
    }
}

extension RSExplicit2 {
    //example 3: explicit rs
    @Model
    class School {
        var name: String
        @Relationship(inverse: \Student.school) var students: [Student]
        
        init(name: String, students: [Student]) {
            self.name = name
            self.students = students
        }
    }
    
    @Model
    class Student {
        var name: String
        
        var school: School
        
        init(name: String, school: School) {
            self.name = name
            self.school = school
        }
    }
}

extension RSDelete {
    /*
     delete rule:
     1. .nullify - being the default - set the related model’s reference to nil when this object is deleted
     2. .cascade
     */
    
    /* delete example 1:
     For example,
     1.we might say that schools can have many students, and when we remove a student from our array we automatically delete that student object entirely. This uses the .cascade delete rule
     2. when we delete the School the students list will automate delete by swiftdata because of .cascade delete rule
     */
    @Model
    class School {
        var name: String
        @Relationship(deleteRule: .cascade, inverse: \Student.school) var students: [Student]

        init(name: String, students: [Student]) {
            self.name = name
            self.students = students
        }
    }
    
    @Model
    class Student {
        var name: String
        
        var school: School
        
        init(name: String, school: School) {
            self.name = name
            self.school = school
        }
    }
}

extension RSDelete1 {
    //explicit rs
    @Model
    class House {
        var address: String
        @Relationship(deleteRule: .cascade, inverse: \Room.house) var rooms: [Room]

        init(address: String, rooms: [Room] = []) {
            self.address = address
            self.rooms = rooms
        }
    }

    @Model
    class Room {
        var house: House
        var name: String

        init(house: House, name: String) {
            self.house = house
            self.name = name
        }
    }
}

extension RSDelete2 {
    //implicit rs - SwiftData infer the inverse relationship
    @Model
    class House {
        var address: String
        @Relationship(deleteRule: .cascade) var rooms: [Room]

        init(address: String, rooms: [Room] = []) {
            self.address = address
            self.rooms = rooms
        }
    }

    @Model
    class Room {
        var house: House?
        var name: String

        init(house: House?, name: String) {
            self.house = house
            self.name = name
        }
    }
}

/*
 Remember, the name “cascade delete” means that multi-level relationships automatically delete all the way down the chain. For example, if we said that a school has many students and each student has many exam results, then gave each of those relationships a cascade delete rule, then deleting the school would delete all the students and all their exam results in one go.
 */
extension RSDelete3 {
    @Model
    class School {
        var name: String
        @Relationship(deleteRule: .cascade, inverse: \Student.school) var students: [Student]

        init(name: String, students: [Student] = []) {
            self.name = name
            self.students = students
        }
    }

    @Model
    class Student {
        var name: String
        var school: School
        @Relationship(deleteRule: .cascade) var results: [Result]

        init(name: String, school: School, results: [Result] = []) {
            self.name = name
            self.school = school
            self.results = results
        }
    }

    @Model
    class Result {
        var subject: String
        var grade: Int

        init(subject: String, grade: Int) {
            self.subject = subject
            self.grade = grade
        }
    }
}


extension RSMaxMin {
    /*
     SwiftData’s @Relationship macro allows us to specify minimum and maximum number of objects that should exist in a one-to-many or many-to-many connection.
     the danger of the relationship rules generally – is that if you break the rules SwiftData's autosave will just silently fail.
     */
    @Model
    class DogWalker {
        var name: String
        @Relationship(maximumModelCount: 5) var dogs: [Dog]

        init(name: String, dogs: [Dog] = []) {
            self.name = name
            self.dogs = dogs
        }
    }

    @Model
    class Dog {
        var name: String
        var walker: DogWalker?

        init(name: String, walker: DogWalker? = nil) {
            self.name = name
            self.walker = walker
        }
    }
    
    
    
    
    
}
