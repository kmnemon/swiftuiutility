//
//  BooksViewContentView.swift
//  swiftuiutility
//
//  Created by ke on 3/31/24.
//

import SwiftUI
import SwiftData

struct BooksViewContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\Book.name),
        SortDescriptor(\Book.joinDate)
    ]
    
    var body: some View {
        NavigationStack {
            BooksView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
            .navigationTitle("Books")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: Book.self)
                    
                    let first = Book(id: UUID(), name: "Harry Potter", genre: "Magic", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = Book(id: UUID(), name: "Shalock Homes", genre: "Detective", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = Book(id: UUID(), name: "Janes", genre: "Drama", joinDate: .now.addingTimeInterval(86400 * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                }
                
                Button(showingUpcomingOnly ? "Show Everyone" : "Shw Upcoming") {
                    showingUpcomingOnly.toggle()
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down"){
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\Book.name),
                            ])
                        Text("Sort by Join Date")
                            .tag([
                                SortDescriptor(\Book.joinDate)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    BooksViewContentView()
}
