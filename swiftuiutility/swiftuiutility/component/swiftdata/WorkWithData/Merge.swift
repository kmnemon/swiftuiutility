//
//  Merge.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/23.
//

import SwiftData
import SwiftUI

/*
 Important: On selection, this needs to show your editing view using the id property of the object to edit, alongside your model container so you can load it in the separate model context. This is a process sometimes called rehydrating the object: we don't want to share a single model object across two model contexts, so instead we pass the identifier and load it separately in our new context.
 
 Using this approach means we have isolated all changes made in EditingView inside its local context, meaning that we can either exit without saving or merge those changes back into the main model container.
 */

struct Merge {
    @Model
    class Issue {
        var name: String

        init(name: String) {
            self.name = name
        }
    }
    
    struct ContentView: View {
        @Environment(\.modelContext) var modelContext
        @Query(sort: \Issue.name) var issues: [Issue]

        var body: some View {
            NavigationStack {
                List(issues) { issue in
                    NavigationLink(value: issue) {
                        Text(issue.name)
                    }
                }
                .navigationDestination(for: Issue.self) { issue in
                    EditingView(issueID: issue.id, in: modelContext.container)
                }
                .navigationTitle("Discarding Test")
                .toolbar {
                    Button("Create Samples", action: createSamples)
                }
            }
        }

        // Creates 10 sample issues
        func createSamples() {
            _ = try? modelContext.delete(model: Issue.self)

            for i in 1...10 {
                let issue = Issue(name: "Issue \(i)")
                modelContext.insert(issue)
            }

            try? modelContext.save()
        }
    }
    
    struct EditingView: View {
        @Environment(\.dismiss) var dismiss
        @Bindable var issue: Issue

        var modelContext: ModelContext

        // Create a local context, then load the issue that was requested or use a default if it can't be found.
        init(issueID: PersistentIdentifier, in container: ModelContainer) {
            modelContext = ModelContext(container)
            modelContext.autosaveEnabled = false
            issue = modelContext.model(for: issueID) as? Issue ?? Issue(name: "New Issue")
        }

        var body: some View {
            Form {
                TextField("Edit the name", text: $issue.name)
            }
            .toolbar {
                Button("Discard") {
                    // Exit without saving.
                    dismiss()
                }

                Button("Save") {
                    // Save then exit.
                    try? modelContext.save()
                    dismiss()
                }
            }
        }
    }
    
}
