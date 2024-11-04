//
//  SheetOptionalView.swift
//  swiftuiutility
//
//  Created by ke on 4/9/24.
//

import SwiftUI

extension SheetOptionalModifier {
    struct Person: Identifiable {
        var id: UUID
        var firstName: String
        var lastName: String
    }
}



extension SheetOptionalModifier {
    struct DetailView: View {
        @Environment(\.dismiss) var dismiss
        var person: Person
        
        @State private var firstName: String
        @State private var lastName: String
        
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
                        dismiss()
                    }
                }
            }
        }
        
        init(person: Person) {
            self.person = person
            
            _firstName = State(initialValue: person.firstName)
            _lastName = State(initialValue: person.lastName)
        }
    }
}

struct SheetOptionalModifier: View {
    @State private var selectedUser: Person?
    
    var body: some View {
        Button("Tap Me") {
            let newPerson = Person(id: UUID(), firstName: "harry", lastName: "potter")
            selectedUser = newPerson
        }
        .sheet(item: $selectedUser) { user in
            Text(user.firstName)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    SheetOptionalModifier()
}
