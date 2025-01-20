//
//  BooksViewContentView.swift
//  swiftuiutility
//
//  Created by ke on 3/31/24.
//

import SwiftUI
import SwiftData

struct CarsViewContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\Car.name),
        SortDescriptor(\Car.joinDate)
    ]
    
    var body: some View {
        NavigationStack {
            CarsView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
            .navigationTitle("Cars")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: Car.self)
                    
                    let first = Car(id: UUID(), name: "Ford", type: "van", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = Car(id: UUID(), name: "Marzda", type: "Sport Car", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = Car(id: UUID(), name: "Benz", type: "van", joinDate: .now.addingTimeInterval(86400 * 10))
                    
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
                                SortDescriptor(\Car.name),
                            ])
                        Text("Sort by Join Date")
                            .tag([
                                SortDescriptor(\Car.joinDate)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    CarsViewContentView()
}
