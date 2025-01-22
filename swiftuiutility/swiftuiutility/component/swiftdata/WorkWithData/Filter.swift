//
//  Filter.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/22.
//

import SwiftData
import SwiftUI

struct Filter {
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
    
    //1. simple filter
    @Query(filter: #Predicate<Movie> { movie in
        movie.director.name == "Ridley Scott"
    }) var movies1: [Movie]
    
    //2. filter - contains
    /*
     Tip: starts(with:) is supported in predicates, but hasPrefix() and hasSuffix() are not.
     starts(with:) are case-sensitive
     */
    @Query(filter: #Predicate<Movie> { movie in
        movie.name.starts(with: "Back to the Future")
    }) var movies2: [Movie]
    
    @Query(filter: #Predicate<Movie> { movie in
        movie.name.localizedStandardContains("JAWS")
    }) var movies3: [Movie]
    
    //3. filter - depend on relationship
    @Query(filter: #Predicate<Movie> { movie in
        movie.cast.count > 10
    }) var movies4: [Movie]
    
    @Query(filter: #Predicate<Movie> { movie in
        movie.cast.isEmpty
    }) var movies5: [Movie]
    
    //will cause crash
    @Query(filter: #Predicate<Movie> { movie in
        movie.cast.isEmpty == false
    }) var movies5a: [Movie]
    
    //4. filter - condiftion
    @Query(filter: #Predicate<Movie> { movie in
        if movie.director.name.contains("Steven") {
            if movie.cost > 100_000_000 {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }) var movies6: [Movie]
    
    @Query(filter: #Predicate<Movie> { movie in
        movie.director.name.contains("Steven") && movie.cost > 100_000_000
    }) var movies7: [Movie]
    
    //5. filter - subset of relationship-query
    @Query(filter: #Predicate<Movie> { movie in
        !movie.cast.contains { $0.name == "Tom Cruise" }
    }) var movies8: [Movie]
    
    
    //6. filter - refer to properties from the parent object
    @Query(filter: #Predicate<Movie> { movie in
        movie.cast.contains { $0.name == movie.director.name }
    }) var directorsWhoActMovies: [Movie]
    
    @Query(filter: #Predicate<Movie> { movie in
        movie.cast.filter { $0.age < 18 }.count >= 3
    }) var movies9: [Movie]
    
    //7. filter - deeper properties with fail
    //not working in ios17
    @Query(filter: #Predicate<Movie> { movie in
        movie.cast.allSatisfy { $0.name.count <= 10 }
    }) var moviesNotWorking1: [Movie]
    
    @Query(filter: #Predicate<Movie> { movie in
        movie.cast.filter { $0.movies.count > 3 }.isEmpty
    }) var moviesNotWorking2: [Movie]
    
    //8.filter - using external value
    static var now: Date { Date.now }

    @Query(filter: #Predicate<Movie> { movie in
        movie.releaseDate > now
    }) var unreleasedMovies: [Movie]
}

