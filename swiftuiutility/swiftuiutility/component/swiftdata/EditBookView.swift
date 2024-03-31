//
//  EditBookView.swift
//  swiftuiutility
//
//  Created by ke on 3/29/24.
//

import SwiftUI
import SwiftData

struct EditBookView: View {
    @Bindable var book: Book
    
    var body: some View {
        Form {
            TextField("name", text: $book.name)
            TextField("genre", text: $book.genre)
        }
        .navigationTitle("Edit Book")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let book = Book(id: UUID(), name: "Harry Potter", genre: "Magic", joinDate: .now.addingTimeInterval(86400 * -10))
        
        return EditBookView(book: book)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
