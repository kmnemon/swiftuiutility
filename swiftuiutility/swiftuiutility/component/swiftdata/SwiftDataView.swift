//
//  SwiftDataView.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI
import SwiftData

struct SwiftDataView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [StudentData]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = StudentData(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                    
                }
            }
        }
    }
}

#Preview {
    SwiftDataView()
}
