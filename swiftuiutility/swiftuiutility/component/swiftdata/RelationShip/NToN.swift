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
        //@Relationship(deleteRule: .nullify, inverse: \Movie.director) var movies: [Movie]

        init(name: String, movies: [Movie]) {
            self.name = name
            self.movies = movies
        }
    }
}
