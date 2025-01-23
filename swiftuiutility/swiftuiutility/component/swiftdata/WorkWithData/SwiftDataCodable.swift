//
//  SwiftDataCodable.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/23.
//

import SwiftData
import SwiftUI

/*
 Important: Both those samples insert the data from JSON into a model context, so they are stored in SwiftData. However, whether or not you choose to insert the data, the very act of creating a Movie instance requires that you load that model as part of your model container, e.g. modelContainer(for: Movie.self).
 */

struct SwiftDataCodable {
    @Environment(\.modelContext) var modelContext

    //1. simple data
    @Model
    class Movie: Codable {
        enum CodingKeys: CodingKey {
            case name
        }

        var name: String

        init(name: String) {
            self.name = name
        }

        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(String.self, forKey: .name)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(name, forKey: .name)
        }
    }
    
    func encodeSwiftData() {
        let movies = [Movie]()
        
        if let data = try? JSONEncoder().encode(movies) {
            print(String(decoding: data, as: UTF8.self))
        }
    }
    
    func decodeSwiftDataFromJson() {
        do {
            guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else {
                fatalError("Failed to find movies.json")
            }

            let data = try Data(contentsOf: url)
            let movies = try JSONDecoder().decode([Movie].self, from: data)

            for movie in movies {
                modelContext.insert(movie)
            }
        } catch {
            print("Failed to load movies.")
        }
    }
    
    func decodeSwiftDataFromRemoteServer() async {
        do {
            let url = URL(string: "https://hws.dev/movies.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let movies = try JSONDecoder().decode([Movie].self, from: data)

            for movie in movies {
                modelContext.insert(movie)
            }
        } catch {
            print("Failed to load movies.")
        }
    }
    
    
    //2. relationship
    @Model
    class Author: Codable {
        enum CodingKeys: CodingKey {
            case firstName, lastName, books
        }

        var firstName: String
        var lastName: String
        var books: [Book]

        init(firstName: String, lastName: String, books: [Book]) {
            self.firstName = firstName
            self.lastName = lastName
            self.books = books
        }

        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            firstName = try container.decode(String.self, forKey: .firstName)
            lastName = try container.decode(String.self, forKey: .lastName)
            books = try container.decode([Book].self, forKey: .books)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(firstName, forKey: .firstName)
            try container.encode(lastName, forKey: .lastName)
            try container.encode(books, forKey: .books)
        }
    }

    @Model
    class Book: Codable {
        enum CodingKeys: CodingKey {
            case title, genre
        }

        var title: String
        var genre: String

        init(title: String, genre: String) {
            self.title = title
            self.genre = genre
        }

        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            title = try container.decode(String.self, forKey: .title)
            genre = try container.decode(String.self, forKey: .genre)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(title, forKey: .title)
            try container.encode(genre, forKey: .genre)
        }
    }
    
    
    
    
}
