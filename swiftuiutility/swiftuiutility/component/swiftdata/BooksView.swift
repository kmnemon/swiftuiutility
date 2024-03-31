//
//  BooksView.swift
//  swiftuiutility
//
//  Created by ke on 3/31/24.
//

import SwiftUI
import SwiftData

struct BooksView: View {
    @Query var books: [Book]
    
    var body: some View {
        List(books) { book in
            Text(book.name)
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<Book>]) {
        _books = Query(filter: #Predicate<Book> { book in
            book.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
}

#Preview {
    BooksView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\Book.name)])
        .modelContainer(for: Book.self)
}
