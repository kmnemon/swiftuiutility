//
//  FetchDescriptorExample.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/22.
//

import SwiftData
import SwiftUI

struct FetchDescriptorExample {
    @Environment(\.modelContext) var modelContext
    
    //9.using with SwiftUI
    static var descriptor: FetchDescriptor<Movie> {
        var descriptor = FetchDescriptor<Movie>(sortBy: [SortDescriptor(\.releaseDate, order: .reverse)])
        descriptor.fetchLimit = 10
        return descriptor
    }
    
    @Query(descriptor) var latestMovies: [Movie]

    
    @Model
    class Movie {
        var name: String
        var director: Director
        var releaseDate: Date
        
        init(name: String, director: Director, releaseDate: Date) {
            self.name = name
            self.director = director
            self.releaseDate = releaseDate
        }
    }
    
    @Model
    class Director {
        var name: String
        
        init(name: String) {
            self.name = name
        }
    }
}

extension FetchDescriptorExample {
    /*
     That loads all instances of a Movie model, with no filtering or sorting applied. It won’t load any relationships automatically, and will instead load those only when you request them.
     
     Important: If you issue a custom fetch immediately after inserting some data, any data linked through relationships won’t be visible even if you’ve manually called save(), and even if you specifically set includePendingChanges to true. Yes, when you call save() the data is written to disk immediately, but SwiftData seems to wait until the next runloop before making that data available for querying.
     */
    func simpleFetch() {
        //1. simple fetch
        let fetchDescriptor = FetchDescriptor<Movie>()
        
        //2. sort fetch
        let fetchDescriptor1 = FetchDescriptor<Movie>(sortBy: [SortDescriptor(\.name), SortDescriptor(\.releaseDate, order: .reverse)])

        //3. filter fetch
        let now = Date.now
        let unreleasedMovies = FetchDescriptor<Movie>(predicate: #Predicate { movie in
            movie.releaseDate > now
        })
        
        //4. limit fetch
        var fetchDescriptor2 = FetchDescriptor<Movie>(sortBy: [SortDescriptor(\.releaseDate, order: .reverse)])
        fetchDescriptor2.fetchLimit = 3
        
        //5. page fetch
        /*
         This works great in combination with the offset parameter of fetch descriptors, which allow us to do paging – we can tell SwiftData to skip the first n results. This is helpful when you know you have many results, so rather than fetching everything at once you can instead fetch in pages of 50 or 100 at a time.
         That will set fetchOffset to 200 and fetchLimit to 100, meaning that SwiftData will attempt to return objects 201 to 300 in the results.
         */
        let pageSize = 100
        let pageNumber = 2

        var fetchDescriptor3 = FetchDescriptor<Movie>(sortBy: [SortDescriptor(\.releaseDate, order: .reverse)])
        fetchDescriptor3.fetchOffset = pageNumber * pageSize
        fetchDescriptor3.fetchLimit = pageSize
        
        //6. choose properties to fetch
        /*
         Note: If you don’t include a property in propertiesToFetch then later use it, SwiftData will automatically fetch the data at the point of use. This uses the same system of faulting that Core Data used – the properties you don’t request are filled with placeholders that automatically get substituted with their real data on request.
         */
        var fetchDescriptor4 = FetchDescriptor<Movie>(sortBy: [SortDescriptor(\.releaseDate, order: .reverse)])
        fetchDescriptor4.propertiesToFetch = [\.name, \.releaseDate]
        
        //7. prefetch - prefetch the relationship's object director
        var fetchDescriptor5 = FetchDescriptor<Movie>(sortBy: [SortDescriptor(\.releaseDate, order: .forward)])
        fetchDescriptor5 .relationshipKeyPathsForPrefetching = [\.director]
        
        //8. includePendingChanges
        /*
         The last customization point is includePendingChanges, which controls whether the fetch should include changes you’ve made that have yet to be saved. This defaults to true, and while there were one or two places you would want otherwise with Core Data I genuinely can’t see this being useful in SwiftData – I’d leave it alone, if I were you.
         */
        
        
        do {
            let movies = try modelContext.fetch(fetchDescriptor)

            for movie in movies {
                print("Found \(movie.name)")
            }
        } catch {
            print("Failed to load Movie model.")
        }
    }
    
    
    
}
