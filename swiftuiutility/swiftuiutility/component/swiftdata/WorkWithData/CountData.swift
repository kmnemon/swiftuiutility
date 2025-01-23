//
//  CountData.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/22.
//

import SwiftData
import SwiftUI

/*
 using fetchCount do not loading objects into memory
 */
struct CountData {
    @Environment(\.modelContext) var modelContext


    @Model
    class Employee {
        var salary: Double
        
        init(salary: Double) {
            self.salary = salary
        }
    }
    
    func countData() {
        let descriptor = FetchDescriptor<Employee>(predicate: #Predicate { $0.salary > 100_000 })
        let count = (try? modelContext.fetchCount(descriptor)) ?? 0
    }
    
}

