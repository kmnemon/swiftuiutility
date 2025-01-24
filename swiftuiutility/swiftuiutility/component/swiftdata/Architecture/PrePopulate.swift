//
//  PrePopulate.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/24.
//

import SwiftData
import SwiftUI
import CoreData

//https://www.hackingwithswift.com/quick-start/swiftdata/how-to-pre-populate-an-app-with-an-existing-swiftdata-database
struct PrePopulate {
    //1. create date file
    @Model
    class User {
        var name: String

        init(name: String) {
            self.name = name
        }
    }
    
    struct ContentView: View {
        var body: some View {
            VStack {
                Button("Create Data") { create() }
            }
        }

        func create() {
            // Load our data model
            let container = NSPersistentContainer(name: "Model")

            // Write to a specific store filename, for easier deletion and copying.
            let storeURL = URL.documentsDirectory.appending(path: "users.store")

            if let description = container.persistentStoreDescriptions.first {
                // Delete all existing data.
                try? FileManager.default.removeItem(at: storeURL)

                // Make Core Data write to our new store URL.
                description.url = storeURL

                // Force WAL mode off.
                description.setValue("DELETE" as NSObject, forPragmaNamed: "journal_mode")
            }

            container.loadPersistentStores { description, error in
                do {
                    // Add all your pre-fill data here.
                    for i in 1...10_000 {
//                        let user = User(context: container.viewContext)
//                        user.name = "User \(i)"
//                        container.viewContext.insert(user)
                    }

                    // Ensure all our changes are fully saved.
                    try container.viewContext.save()

                    // Adjust this to the actual location where you want the file to be saved.
                    let destination = URL(filePath: "/Users/twostraws/Desktop/users.store")
                    try FileManager.default.copyItem(at: storeURL, to: destination)
                } catch {
                    print("Failed to create data: \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    //2. ship the file to the App Store
    /*
     The first step is to copy users.store into your actual app project. Important: Make sure you add the file to your app's target, so it's included in the build.

     Next, we need to modify your App struct so that you load a model container from that custom file, and use that with SwiftUI:
     */
    struct ProductionApp: App {
        let container: ModelContainer

        var body: some Scene {
            WindowGroup {
                ContentView()
            }
            .modelContainer(container)
        }

        init() {
            do {
                guard let storeURL = Bundle.main.url(forResource: "users", withExtension: "store") else {
                    fatalError("Failed to find users.store")
                }

                let config = ModelConfiguration(url: storeURL)
                container = try ModelContainer(for: User.self, configurations: config)
            } catch {
                fatalError("Failed to create model container: \(error)")
            }
        }
    }
    
}
