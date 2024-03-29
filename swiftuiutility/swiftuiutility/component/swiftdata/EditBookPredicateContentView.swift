//
//  EditBookPredicateContentView.swift
//  swiftuiutility
//
//  Created by ke on 3/29/24.
//

import SwiftUI
import SwiftData

struct EditBookPredicateContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Book> { book in
        book.name.localizedStandardContains("H") &&
        book.genre == "Detective"
        /* limit syntax of is else
        if book.name.localizedStandardContains("R") {
            return true
        } else {
            return false
        }
         */
    }, sort: \Book.name) var books: [Book]
    
    var body: some View {
        NavigationStack {
            List(books) { book in
                Text(book.name)
            }
            .navigationTitle("Books")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: Book.self)
                    
                    let first = Book(id: UUID(), name: "Harry Potter", genre: "Magic")
                    let second = Book(id: UUID(), name: "Shalock Homes", genre: "Detective")
                    let third = Book(id: UUID(), name: "Janes", genre: "Drama")
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                }
            }
        }
    }
}

#Preview {
    EditBookPredicateContentView()
}
