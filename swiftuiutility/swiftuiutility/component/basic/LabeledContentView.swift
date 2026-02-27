//
//  LabeledContentView.swift
//  swiftuiutility
//
//  Created by ke Liu on 2/27/26.
//

import SwiftUI
class BookModel: Identifiable {
    var bookId: UUID
    var title: String
    var price: Decimal
    var available: Bool
    var pages: Int
    var url: URL
    var lastUpdated = Date()
    var cover: Data?
    
    var id: UUID { bookId }
    
    init(bookId: UUID, title: String, price: Decimal, available: Bool, pages: Int, url: URL, cover: Data? = nil) {
        self.bookId = bookId
        self.title = title
        self.price = price
        self.available = available
        self.pages = pages
        self.url = url
        self.cover = cover
    }
}

struct LabeledContentView: View {
    private let sampleBook = BookModel(
        bookId: UUID(),
        title: "Sample Book",
        price: 19.99,
        available: true,
        pages: 320,
        url: URL(string: "https://example.com/sample-book")!
    )
    
    var books: [BookModel] { [sampleBook] }
    
    var body: some View {
        List(books) { book in
            LabeledContent("Last Updated", value: book.lastUpdated.formatted(date: .numeric, time: .omitted))
            LabeledContent("Pages", value: "\(book.pages)")
            LabeledContent {
                Link("Learn More", destination: book.url)
            } label: {
                Text(book.price, format: .currency(code: "USD"))
            }
        }
        .padding(.vertical)
    }
}
