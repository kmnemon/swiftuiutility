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

/*
 1. ModelContainer - is responsible for creating and managing the actual database file used for all SwiftData’s storage needs.
 2. ModelContext - has the job of tracking all objects that have been created, modified, and deleted in memory, so they can all be saved to the model container at some later point.
 3. ModelConfiguration - determines how and where data is stored, including which CloudKit container to use if any, and whether saving should be enabled or not. This configuration is provided to your model container to determine how it behaves.
 */



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
