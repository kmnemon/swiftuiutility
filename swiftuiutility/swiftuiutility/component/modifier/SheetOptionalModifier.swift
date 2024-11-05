//
//  SheetOptionalView.swift
//  swiftuiutility
//
//  Created by ke on 4/9/24.
//

import SwiftUI

extension SheetOptionalModifier {
    struct Person: Identifiable, Equatable {
        var id: UUID
        var firstName: String
        var lastName: String
        
        static func ==(lhs:Person, rhs: Person) -> Bool {
            lhs.id == rhs.id
        }
    }
    

}



extension SheetOptionalModifier {
    struct EditView: View {
        @Environment(\.dismiss) var dismiss
        var person: Person
        
        @State private var firstName: String
        @State private var lastName: String
        var onSave: (Person) -> Void
        
        var body: some View {
            NavigationStack {
                Form {
                    Section {
                        TextField("first name", text: $firstName)
                        TextField("last name", text: $lastName)
                    }
                }
                .navigationTitle("Person details")
                .toolbar {
                    Button("save"){
                        var newPerson = person
                        newPerson.id = UUID()
                        newPerson.firstName = firstName
                        newPerson.lastName = lastName
                        onSave(newPerson)
                        
                        dismiss()
                    }
                }
            }
        }
        
        init(person: Person, onSave: @escaping (Person) -> Void) {
            self.person = person
            self.onSave = onSave
            
            _firstName = State(initialValue: person.firstName)
            _lastName = State(initialValue: person.lastName)
        }
    }
}

struct SheetOptionalModifier: View {
    @State private var persons = [Person]()
    @State private var selectedUser: Person?
    
    var body: some View {
        Button("Tap Me") {
            let newPerson = Person(id: UUID(), firstName: "harry", lastName: "potter")
            selectedUser = newPerson
        }
        .sheet(item: $selectedUser) { user in
//            Text(user.firstName)
//                .presentationDetents([.medium, .large])
            EditView(person: user) { newPerson in
                if let index = persons.firstIndex(of: user) {
                    persons[index] = newPerson
                }
            }
        }
    }
}

#Preview {
    SheetOptionalModifier()
}
