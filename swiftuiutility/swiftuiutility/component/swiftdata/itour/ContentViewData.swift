//
//  ContentView.swift
//  iTour
//
//  Created by Paul Hudson on 30/09/2023.
//

import SwiftData
import SwiftUI

struct ContentViewData: View {
    @Environment(\.modelContext) var modelContext

    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchText = ""
    @State private var show = "ALL"

    var body: some View {
        NavigationStack(path: $path) {
            DestinationListingView(sort: sortOrder, show: show, searchString: searchText)
                .navigationTitle("iTour")
                .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
                .searchable(text: $searchText)
                .toolbar {
                    Button("Add Destination", systemImage: "plus", action: addDestination)

                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag([SortDescriptor(\Destination.name),
                                      SortDescriptor(\Destination.priority)])

                            Text("Priority")
                                .tag(SortDescriptor(\Destination.priority, order: .reverse))

                            Text("Date")
                                .tag([SortDescriptor(\Destination.date),
                                      SortDescriptor(\Destination.name)])
                        }
                        .pickerStyle(.inline)
                    }
                    
                    Menu("All", systemImage: "arrow.up.arrow.down") {
                        Picker("All", selection: $show) {
                            Text("All Designations")
                                .tag("ALL")

                            Text("Only In Future")
                                .tag("ONLY")

                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }

    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
}

#Preview {
    ContentView()
}
