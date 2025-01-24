//
//  WorkWithPreview.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/24.
//

import SwiftData
import SwiftUI

/*
 Important: If you have a SwiftUI view that depends on one or more properties from a SwiftData object, changing that property will cause the view to be invalidated and re-rendered even if it's currently positioned off-screen.
 */

struct WorkWithPreview {
    @Model
    class User {
        var name: String

        init(name: String) {
            self.name = name
        }
    }

    //example1:
    struct EditingView: View {
        @Environment(\.modelContext) var modelContext
        @Bindable var user: User

        var body: some View {
            Form {
                TextField("Name", text: $user.name)
            }
        }
    }
    
    #Preview {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: User.self, configurations: config)

        let user = User(name: "Test User")
        return EditingView(user: user)
            .modelContainer(container)
    }
    
    //example2: using query
    struct ContentView: View {
        @Query(sort: [SortDescriptor(\User.name, comparator: .localizedStandard)]) var users: [User]

        var body: some View {
            NavigationStack {
                List(users) { user in
                    Text(user.name)
                }
            }
        }
    }
    
    #Preview {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: User.self, configurations: config)

        for i in 1..<10 {
            let user = User(name: "Example User \(i)")
            container.mainContext.insert(user)
        }

        return ContentView()
            .modelContainer(container)
    }
    
    //example3:
    /*
     it's usually a good idea to set up some kind of standard preview singleton you can work with in many views – something that creates the in-memory configuration, creates a container from it using whatever types are in your project, then inserts some standard sample data
     */
    @MainActor
    class DataController {
        static let previewContainer: ModelContainer = {
            do {
                let config = ModelConfiguration(isStoredInMemoryOnly: true)
                let container = try ModelContainer(for: User.self, configurations: config)

                for i in 1...9 {
                    let user = User(name: "Example User \(i)")
                    container.mainContext.insert(user)
                }

                return container
            } catch {
                fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
            }
        }()
    }
    
}


