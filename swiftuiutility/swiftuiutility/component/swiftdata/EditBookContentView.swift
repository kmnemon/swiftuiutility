//
//  EditBookContentView.swift
//  swiftuiutility
//
//  Created by ke on 3/29/24.
//

import SwiftUI
import SwiftData

struct EditBookContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Book.name) var books: [Book]
    @State private var path = [Book]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(books) { book in
                NavigationLink(value: book) {
                    Text(book.name)
                }
            }
            .navigationTitle("Books")
            .navigationDestination(for: Book.self) { book in
                    EditBookView(book: book)
            }
            .toolbar {
                Button("Add User", systemImage: "plus") {
                    let book = Book(id: UUID(), name: "", genre: "")
                    modelContext.insert(book)
                    path = [book]
                }
            }
        }
    }
}

#Preview {
    EditBookContentView()
}
