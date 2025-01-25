//
//  UITestWithSwiftData.swift
//  swiftuiutility
//
//  Created by ke on 1/24/25.
//

import SwiftData
import SwiftUI

//https://www.hackingwithswift.com/quick-start/swiftdata/how-to-write-ui-tests-for-your-swiftdata-code
struct UITestWithSwiftData {
    //1. Model
    @Model
    class Movie {
        var name: String
        var director: String
        var releaseYear: Int

        init(name: String, director: String, releaseYear: Int) {
            self.name = name
            self.director = director
            self.releaseYear = releaseYear
        }
    }
    
    //2. inject
    /*
     WindowGroup {
         ContentView()
     }
     .modelContainer(for: Movie.self)
     */
    
    //3. a sample SwiftUI view to test,
    struct ContentView: View {
        @Query(sort: \Movie.name) var movies: [Movie]
        @Environment(\.modelContext) var modelContext

        var body: some View {
            NavigationStack {
                List(movies) { movie in
                    VStack(alignment: .leading) {
                        Text(movie.name)
                            .font(.headline)

                        Text("Directed by: \(movie.director)")
                    }
                }
                .navigationTitle("MovieDB")
                .toolbar {
                    Button("Add Samples", action: addSamples)
                }
            }
        }

        func addSamples() {
            let redOctober = Movie(name: "The Hunt for Red October", director: "John McTiernan", releaseYear: 1990)
            let sneakers = Movie(name: "Sneakers", director: "Phil Alden Robinson", releaseYear: 1992)
            let endLiss = Movie(name: "Endliss Possibilities: The Casey Liss Story", director: "Erin Liss", releaseYear: 2006)

            modelContext.insert(redOctober)
            modelContext.insert(sneakers)
            modelContext.insert(endLiss)
        }

        func clear() {
            try? modelContext.delete(model: Movie.self)
        }
    }
}
