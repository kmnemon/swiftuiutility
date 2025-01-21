//
//  DeleteData.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/21.
//

import SwiftData
import SwiftUI

struct DeleteData {}

/*
 Important: Calling delete() marks your object for deletion, but doesn’t actually complete the deletion until a save happens. Between those two states your object is stored in the deletedModelsArray of your property, and if the deletion is rolled back the object will be moved back from deletedModelsArray to your live data. Alternatively, if you have autosave disabled and don’t call save() manually, your deletions will automatically be rolled back.
 */
extension DeleteData {
    @Model
    class Student {
        var name: String
        init(name: String) {
            self.name = name
        }
    }
    
    struct ContentView: View {
        @Environment(\.modelContext) var modelContext

        @State private var students = [Student]()
        
        
        var body: some View {
            //example 1: delete simple object
            List(students) { student in
                Text(student.name)
                    .swipeActions {
                        Button("Delete", systemImage: "trash", role: .destructive) {
                            modelContext.delete(student)
                        }
                    }
            }
        }
        
        //example 2: onDelete
        func delete(_ indexSet: IndexSet) {
            for i in indexSet {
                let student = students[i]
                modelContext.delete(student)
            }
        }
        
        //example 3: Delete all objects
        func deleteAllObjects() {
            do {
                try modelContext.delete(model: Student.self)
            } catch {
                print("Failed to delete all students.")
            }
        }
        
        //example 4: Delete a subset of objects
        func deleteSubsetObjects() throws {
            try modelContext.delete(model: Student.self, where: #Predicate { student in
                student.name.isEmpty
            })
        }
    }
    
    
    
}
