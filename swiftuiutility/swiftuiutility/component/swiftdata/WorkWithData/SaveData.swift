//
//  SaveData.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/21.
//

import SwiftData
import SwiftUI

struct SaveData {
    @Environment(\.modelContext) var modelContext
}

extension SaveData {
    @Model
    class House {
        var address: String
        
        init(address: String) {
            self.address = address
        }
    }
    
    //example 1:
    /*
     all SwiftData objects have an id property that unique identifies them, however before the object has been saved for the first time that identifier will be temporary
     */
    func getObjectId() -> PersistentIdentifier {
        let house = House(address: "10 Downing Street, London")
        modelContext.insert(house)
        
        print(house.id) //temporary id
        try? modelContext.save()
        print(house.id) //id
        
        return house.id
    }
    
    //example 2: manually save and explicit relationship:
    /*
     However, it makes life more difficult because of the way SwiftData resolves explicit relationship data:

     1. If you use an array on one side of your relationship and an optional on the other, SwiftData will correctly infer the relationship and keep both sides in sync even without calling save() on the context.
     2. If you use a non-optional on the other side, you must specify the delete rule manually and call save() when inserting the data, otherwise SwiftData won’t refresh the relationship until application is relaunched – even if you call save() at a later date, and even if you create and run a new FetchDescriptor from scratch.
     */
    
    /* ios17 caution:
     That has a commented-out call to save() inside the create() method, and instead saves the context from a separate Save button. Right now (as of iOS 17.0) this fails – you’ll see Harry listed as going to Hogwarts in the second list and Hogwarts showing no students in the first list, but if you press Save then relaunch the app you’ll see it’s displayed correctly. If you then try uncommenting the save() call inside create(), everything is displayed correctly without a relaunch.
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
    
    struct ContentView: View {
        @Environment(\.modelContext) var modelContext
        @Query var schools: [School]
        @Query var students: [Student]

        var body: some View {
            NavigationStack {
                VStack {
                    List(schools) { school in
                        VStack(alignment: .leading) {
                            Text(school.name)
                            Text(school.students.map(\.name).joined(separator: ", "))
                        }
                    }

                    List(students) { student in
                        VStack(alignment: .leading) {
                            Text(student.name)
                            Text(student.school.name)
                        }
                    }
                }
                .toolbar {
                    Button("Create", action: create)
                    Button("Save") {
                        try? modelContext.save()
                    }
                }
            }
        }

        func create() {
            let hogwarts = School(name: "Hogwarts", students: [])
            let harry = Student(name: "Harry", school: hogwarts)

            modelContext.insert(hogwarts)
            modelContext.insert(harry)

    //        try? modelContext.save()
        }
    }
    
}
