//
//  Enumerate.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/23.
//

import SwiftData
import SwiftUI
/*
 traverse large amounts of data efficiently
 
 *** modelContext.enumerate(descriptor, batchSize: 1000)
 This is a trade-off: using a lower batch size ought to save memory, but will increase the amount of disk I/O. Similarly, using a larger batch size will reduce disk I/O but increase memory.
 All that probably sounds very welcome, but in practice things aren’t so straightforward. Yes, adjusting the batch size ought to let us trade memory for I/O to get performance that fits our app, but at the time of writing SwiftData seems to keep all the objects in memory even after they have been processed, so you get huge memory bloat even with a reduced batch size.
 */
struct Enumerate {
    @Environment(\.modelContext) var modelContext

    @Model
    class Student {
        var name: String
        var scores: [Double]
        
        init(name: String, scores: [Double]) {
            self.name = name
            self.scores = scores
        }
    }
    
    func enumerateExample() {
        let descriptor = FetchDescriptor<Student>()
        var totalResults = 0
        var totalDistinctions = 0
        var totalPasses = 0

        do {
            //modelContext.enumerate(descriptor, batchSize: 1000)
            //the default batchSize: 5000
            try modelContext.enumerate(descriptor) { student in
                totalResults += student.scores.count
                totalDistinctions += student.scores.filter { $0 >= 85 }.count
                totalPasses += student.scores.filter { $0 >= 70 && $0 < 85 }.count
            }
        } catch {
            print("Unable to calculate student results.")
        }

        print("Total test results: \(totalResults)")
        print("Distinctions: \(totalDistinctions)")
        print("Passes: \(totalPasses)")
    }
    
   
}
