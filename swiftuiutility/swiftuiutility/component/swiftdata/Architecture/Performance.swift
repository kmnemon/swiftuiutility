//
//  Performance.swift
//  swiftuiutility
//
//  Created by ke on 1/25/25.
//

import SwiftData
import SwiftUI

struct Performance {}

//1. Limit the amount of data you fetch
//filter and sort in swiftdata rather than load them all the filter, sort them
/*
 a. If you know you'll only use certain properties from your model object, set the propertiesToFetch to an array of the key paths you actually need. If there are some you didn't list there but end up needing they will automatically be fetched, but you're generating extra work.
 b. If you don't need all your results, set a custom fetchLimit to load only the top 100 or 500 objects. If you end up needing more, make another fetch descriptor with a fetchOffset so that you get paging
 */

//2. Prefetch relationships you definitely need
/*
 SwiftData lazily loads all relationship data, fetching it only when accessed by your object. If you know the relationship will be used immediately, you should create a fetch descriptor with its relationshipKeyPathsForPrefetching set to the relationships you'll use.

 When this option is provided, SwiftData will load your model and the specified relationships in a single pass, which can be more efficient than regularly fetching individual relationships as they are used.
 */

//3. Order your predicate checks for efficiency
/*
 a. If you can, place the most restrictive checks first to eliminate data as quickly as possible.
 b. Run faster checks earlier, such as preferring integer comparison to a string comparison.
 */

extension Performance {
    @Model
    class Employee {
        var department: String
        var salary: Int
        
        init(department: String, salary: Int) {
            self.department = department
            self.salary = salary
        }
    }
    
    func lowerPerformance() {
        var descriptor = FetchDescriptor<Employee>()
        descriptor.predicate = #Predicate {
            if $0.department.localizedStandardContains("Engineering") {
                return $0.salary > 200_000
            } else {
                return false
            }
        }
    }
    
    func betterPerformance() {
        var descriptor = FetchDescriptor<Employee>()
        descriptor.predicate = #Predicate {
            if $0.salary > 200_000 {
                return $0.department.localizedStandardContains("Engineering")
            } else {
                return false
            }
        }
    }
}

//4. Fetch counts when you only want the number of matches
/*
 ModelContext has a dedicated fetchCount() method for times when you want to know how many objects would be returned for a given query. This is significantly more efficient than fetching a whole array then reading its count property.
 */

//5. Use background task for batch inserts
/*
 If you have lots of data to insert, perhaps as a result of a network call, consider doing it on a background task so that you leave Swift's main actor free to do all its work without freezing up the UI.

 Important: Please remember that ModelContext and all SwiftData models are not sendable, which means they are bound to the actor where they were made. If you want to work with background tasks, pass in your ModelContainer object that is sendable, then make a local context on the other task.
 */

//6. Push large data blobs to external storage
/*
 Saving binary data such as images and movies in external storage can dramatically improve speed and lower memory usage, because SwiftData will load them only when needed.
 Any data that is stored externally is loaded only when it's actually used, which makes loading both faster and lighter in memory.
 */

extension Performance {
    @Model
    class User {
        var name: String
        var number: Int
        @Attribute(.externalStorage) var avatar: Data //large data

        init(name: String, number: Int, avatar: Data) {
            self.name = name
            self.number = number
            self.avatar = avatar
        }
    }
}

//7. Don't worry about checking for changes before saving
//no longer needed in swiftdata

//8.When in doubt, ask Instruments
/*
 Xcode's Instruments tool comes with a dedicated Data Persistence instrument that's able to report back on how many fetches are being, how many faults are being triggered, and also how often saves happen.
 */
