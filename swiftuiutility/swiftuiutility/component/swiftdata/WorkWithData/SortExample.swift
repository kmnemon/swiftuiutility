//
//  SortExample.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/22.
//

import SwiftData
import SwiftUI

/*
 1. simple sorts - key path
 2. complex sorts - array of SortDescriptor
 */


struct SortExample {
    @Environment(\.modelContext) var modelContext
    
    @Model
    class Movie {
        var name: String
        var cost: Double
        var director: Director
        var releaseDate: Date
        var cast: [Cast]
        
        init(name: String, cost: Double, director: Director, releaseDate: Date, cast: [Cast]) {
            self.name = name
            self.cost = cost
            self.director = director
            self.releaseDate = releaseDate
            self.cast = cast
        }
    }
    
    @Model
    class Director {
        var name: String
        
        init(name: String) {
            self.name = name
        }
    }
    
    @Model
    class Cast {
        var name: String
        var age: Int
        var movies: [Movie]
        
        init(name: String, age: Int, movies: [Movie]) {
            self.name = name
            self.age = age
            self.movies = movies
        }
    }
    
    @Model
    class User {
        var name: String
        
        init(name: String) {
            self.name = name
        }
    }
    
    //1. key path
    @Query(sort: \Movie.name) var movies1: [Movie]
    
    //2. key path - descending alphabeical
    @Query(sort: \Movie.name, order: .reverse) var movies2: [Movie]

    //3. key path - sort using rs
    @Query(sort: \Movie.director.name) var movies3: [Movie]
    
    //4.SortDescriptor
    @Query(sort: [SortDescriptor(\Movie.name), SortDescriptor(\Movie.releaseDate, order: .reverse), SortDescriptor(\Movie.director.name)]) var movies4: [Movie]
    
    //5.FetchDescriptor
    func fetchDescriptorWithSort() {
        var descriptor = FetchDescriptor<Movie>(sortBy: [SortDescriptor(\.name)])
        let results = (try? modelContext.fetch(descriptor)) ?? []
    }
    
    //6. Sort Nature order
    //User1 User10, User100, User11... to User1, User2, User3
    @Query(sort: [SortDescriptor(\User.name, comparator: .localizedStandard)]) var users: [User]


    
}
