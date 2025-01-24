//
//  DiscardChange.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/24.
//

import SwiftData
import SwiftUI

/*
 https://www.hackingwithswift.com/quick-start/swiftdata/how-to-discard-changes-to-a-swiftdata-object
 SwiftData makes it easy to pass an object between various parts of your app, and have changes made in one place automatically be reflected elsewhere: just create an editing view with your model object as @Bindable, and SwiftData takes care of the rest.

 However, it's a little trickier when you want the user to be able to save or discard their changes in an editing view, because SwiftData will automatically synchronize changes as soon as they happen
 The problem happens because SwiftData doesn't have the concept of a child context, so we can't make some isolated changes then merge them upwards only when needed. Instead, the best solution I've found is to create a peer context from the same container, pass in your model object's ID to your detail view, then load it there using the new context with autosave disabled.

 Tip: This solution works, but I've found it causes SwiftUI to screw up its list deselection animation when returning to the parent view – the row you were editing stays highlighted. I have yet to find a workaround for this, so if you have a better idea please let me know!
 */
struct DiscardChange {
    @Model
    class Issue {
        var name: String

        init(name: String) {
            self.name = name
        }
    }
    
    //rehydrating
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
                .navigationTitle("Discardable Editing")
            }
        }
        
        struct EditingView: View {
            @Environment(\.dismiss) var dismiss
            @Bindable var issue: Issue

            var modelContext: ModelContext

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
                        dismiss()
                    }

                    Button("Save") {
                        try? modelContext.save()
                        dismiss()
                    }
                }
            }
        }
    }
}
