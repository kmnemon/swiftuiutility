//
//  CustomModelContainer.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/20.
//

import SwiftData
import Foundation

/*
@main
struct CustomModelContainer: App {
    var container: ModelContainer
    
    init() {
        do {
            let storeURL = URL.documentsDirectory.appending(path: "database.sqlite")
            let config = ModelConfiguration(url: storeURL, allowsSave: false)

            container = try ModelContainer(for: Recipe.self, configurations: config)
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}

*/


//example 2: create a configuration that loads specific model types, writes to a custom database file, and connects to a particular CloudKit database name
/*
 let storeURL = URL.documentsDirectory.appending(path: "database.sqlite")
 let schema = Schema([Recipe.self, User.self])
 let config = ModelConfiguration(schema: schema, url: storeURL, cloudKitDatabase: .private("pastalavista"))
 container = try ModelContainer(for: schema, configurations: config)
 */


//example 3: multiple configurations
/*
@main
struct RecipeBookApp: App {
    var container: ModelContainer

    init() {
        do {
            let config1 = ModelConfiguration(for: Recipe.self)
            let config2 = ModelConfiguration(for: Comment.self, isStoredInMemoryOnly: true)

            container = try ModelContainer(for: Recipe.self, Comment.self, configurations: config1, config2)
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}

*/

//example 4: change swiftdata's underlying storage filename
//if you wanted to write to an exact file in your documents directory rather than the default location of default.store
/*
 @main
 struct RecipeBookApp: App {
     var container: ModelContainer

     init() {
         do {
             let storeURL = URL.documentsDirectory.appending(path: "database.sqlite")
             let config = ModelConfiguration(url: storeURL)
             container = try ModelContainer(for: Recipe.self, configurations: config)
         } catch {
             fatalError("Failed to configure SwiftData container.")
         }
     }

     var body: some Scene {
         WindowGroup {
             ContentView()
         }
         .modelContainer(container)
     }
 }
 */


//example 5: diable autosave
/*
 WindowGroup {
     ContentView()
 }
 .modelContainer(for: User.self, isAutosaveEnabled: false)
 */


//If you’re making a new context by hand, autosave is usually automatically disabled. You can enable it by adjust its autosaveEnabled Boolean like this:
/*
 let newContext = ModelContext(container)
 print(newContext.autosaveEnabled)
 newContext.autosaveEnabled = true
 */
