//
//  NToN.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/21.
//

import SwiftData


struct OneToOne {}
struct OneToMany {}
struct ManyToMany {}


extension OneToOne {
    @Model
    class Country {
        var name: String
        var capitalCity: City?

        init(name: String, capitalCity: City? = nil) {
            self.name = name
            self.capitalCity = capitalCity
        }
    }

    @Model
    class City {
        var name: String
        var latitude: Double
        var longitude: Double
        var country: Country?

        init(name: String, latitude: Double, longitude: Double, country: Country? = nil) {
            self.name = name
            self.latitude = latitude
            self.longitude = longitude
            self.country = country
        }
    }
    
    func applyOneToOne() {
        let country = Country(name: "England")
        let city = City(name: "London", latitude: 51.507222, longitude: -0.1275, country: country)

//        modelContext.insert(city)
    }
}


extension OneToMany {
    @Model
    class Movie {
        var name: String
        var releaseYear: Int
        var director: Director?

        init(name: String, releaseYear: Int, director: Director) {
            self.name = name
            self.releaseYear = releaseYear
            self.director = director
        }
    }

    @Model
    class Director {
        var name: String
        //implicit
        var movies: [Movie]
        //explicit
        //.nullify - when we delete a director we replace them(class Movie's director) with nil in any movie they directed
        //@Relationship(deleteRule: .nullify, inverse: \Movie.director) var movies: [Movie]

        init(name: String, movies: [Movie]) {
            self.name = name
            self.movies = movies
        }
    }
}

extension ManyToMany {
    //swiftData will not infer many-to-many relationships
    @Model
    class Actor {
        var name: String
        var movies: [Movie]

        init(name: String, movies: [Movie]) {
            self.name = name
            self.movies = movies
        }
    }

    @Model
    class Movie {
        var name: String
        var releaseYear: Int
        @Relationship(inverse: \Actor.movies) var cast: [Actor]

        init(name: String, releaseYear: Int, cast: [Actor]) {
            self.name = name
            self.releaseYear = releaseYear
            self.cast = cast
        }
    }
    
    func applyManyToMany() {
        let mi2 = Movie(name: "Mission: Impossible 2", releaseYear: 2000, cast: [])
        
        let cruise = Actor(name: "Tom Cruise", movies: [mi2])
        let newton = Actor(name: "Thandiwe Newton", movies: [mi2])

//        modelContext.insert(cruise)
//        modelContext.insert(newton)
    }
    
    func manipulateManyToMany2() {
        let mi2 = Movie(name: "Mission: Impossible 2", releaseYear: 2000, cast: [])
        let cruise = Actor(name: "Tom Cruise", movies: [])
        let newton = Actor(name: "Thandiwe Newton", movies: [])

//        modelContext.insert(mi2)
//        modelContext.insert(cruise)
//        modelContext.insert(newton)

        mi2.cast.append(cruise)
        mi2.cast.append(newton)
    }
    
    func manipulateManyToMany3() {
        let mi2 = Movie(name: "Mission: Impossible 2", releaseYear: 2000, cast: [])
        let cruise = Actor(name: "Tom Cruise", movies: [])
        let newton = Actor(name: "Thandiwe Newton", movies: [])

//        modelContext.insert(mi2)
//        modelContext.insert(cruise)
//        modelContext.insert(newton)

        cruise.movies.append(mi2)
        newton.movies.append(mi2)
    }
    
    
}
