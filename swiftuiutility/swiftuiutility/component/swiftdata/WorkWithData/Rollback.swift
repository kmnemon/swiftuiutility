//
//  rollback.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/23.
//

import SwiftData
import SwiftUI

/*
 we could run a batch of inserts creating lots of users with random lucky numbers, but if any of them have the lucky number of 13 – clearly not a lucky number! – we'll consider the whole batch cursed and exit the task without saving any of them
 */

struct Rollback {
    @Environment(\.modelContext) var modelContext

    @Model
    class User {
        var name: String
        var luckyNumber: Int
        
        init(name: String, luckyNumber: Int) {
            self.name = name
            self.luckyNumber = luckyNumber
        }
    }
    
    func rollbackExample() {
        Task {
            let newContext = ModelContext(modelContext.container)

            for i in 1...1_000 {
                let number = Int.random(in: 1...10_000)

                if number == 13 {
                    print("That's not a lucky number!")
                    return
                }

                let user = User(name: "User \(i)", luckyNumber: number)
                newContext.insert(user)
            }

            try? newContext.save()
        }
    }
}
