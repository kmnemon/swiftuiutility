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
