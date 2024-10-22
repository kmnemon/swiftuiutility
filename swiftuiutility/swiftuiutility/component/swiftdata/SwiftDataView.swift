//
//  SwiftDataView.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI
import SwiftData
//Step 1: Define Data @Model
//Step 2: In swiftuittilityApp define .modelContainer(automate produce modelContext)
//Step 3: Using @Query and modelContext



struct SwiftDataView: View {
    //model context - main context,writing data to disk
    @Environment(\.modelContext) var modelContext
     
    @Query var books: [Book]

    @Query(sort: \Book.name, order: .reverse) var books2: [Book]
    
    @Query(sort: [
        SortDescriptor(\Book.name),
        SortDescriptor(\Book.genre)
    ]) var books3: [Book]
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    let name = ["Harry Potter", "Ring", "Hermione", "Luna"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book){
                        Text(book.name)
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Library")
            .toolbar {
                Button("Add") {
                    let bookName = name.randomElement()!
                    let genre = genres.randomElement()!
                    
                    let book = Book(id: UUID(), name: "\(bookName)", genre: genre, joinDate: .now.addingTimeInterval(86400 * 10))
                    modelContext.insert(book)
                }
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        
        return SwiftDataView()
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
    
   
}
