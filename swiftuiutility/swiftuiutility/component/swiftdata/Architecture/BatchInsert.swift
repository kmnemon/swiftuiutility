//
//  BatchInsert.swift
//  swiftuiutility
//
//  Created by ke on 1/24/25.
//

import SwiftData
import SwiftUI
/*
 Important: It bears repeating that if you create the model context as a property of your actor rather than inside the method, your batch inserts will run an order of magnitude slower.
 
 Need to know:
 Each time you call save() your changes will automatically be reflected on your main context, so for example any @Query properties will update.
 
 */
struct BatchInsert {
    @Model
    class Movie {
        var title: String
        var cast: [String]
        
        init(title: String, cast: [String]) {
            self.title = title
            self.cast = cast
        }
    }
    
    //https://www.hackingwithswift.com/quick-start/swiftdata/how-to-batch-insert-large-amounts-of-data-efficiently
    actor BackgroundImporter {
        var modelContainer: ModelContainer
        
        init(modelContainer: ModelContainer) {
            self.modelContainer = modelContainer
        }
        
        func backgroundInsert() async throws {
            /*
             It creates the model context inside the backgroundInsert() method, thus avoiding the significant cost of accessing an actor's property repeatedly.
             */
            let modelContext = ModelContext(modelContainer)
            
            let batchSize = 1000
            let totalObjects = 100_000
            
            for i in 0..<(totalObjects / batchSize) {
                for j in 0..<batchSize {
                    // try await Task.sleep(for: .milliseconds(1))
                    let issue = Movie(title: "Movie \(i * batchSize + j)", cast: [])
                    modelContext.insert(issue)
                }
                
                try modelContext.save()
            }
        }
    }
}
