//
//  UnitTestWithSwiftData.swift
//  swiftuiutility
//
//  Created by ke on 1/24/25.
//

import SwiftData
import SwiftUI

struct UnitTestWithSwiftData {
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
}

extension ContentView4 {
    @Observable
    final class ViewModel {
        private let modelContext: ModelContext
        private(set) var movies = [UnitTestWithSwiftData.Movie]()

        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            fetchData()
        }

        func addSamples() {
            let redOctober = UnitTestWithSwiftData.Movie(name: "The Hunt for Red October", director: "John McTiernan", releaseYear: 1990)
            let sneakers = UnitTestWithSwiftData.Movie(name: "Sneakers", director: "Phil Alden Robinson", releaseYear: 1992)
            let endLiss = UnitTestWithSwiftData.Movie(name: "Endliss Possibilities: The Casey Liss Story", director: "Erin Liss", releaseYear: 2006)

            modelContext.insert(redOctober)
            modelContext.insert(sneakers)
            modelContext.insert(endLiss)
            try? modelContext.save()
            fetchData()
        }

        func clear() {
            try? modelContext.delete(model: UnitTestWithSwiftData.Movie.self)
            try? modelContext.save()
            fetchData()
        }

        func fetchData() {
            do {
                let descriptor = FetchDescriptor<UnitTestWithSwiftData.Movie>(sortBy: [SortDescriptor(\.name)])
                movies = try modelContext.fetch(descriptor)
            } catch {
                print("Fetch failed")
            }
        }
    }
}

struct ContentView4: View {
    @State private var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.movies) { movie in
                VStack(alignment: .leading) {
                    Text(movie.name)
                        .font(.headline)

                    Text("Directed by: \(movie.director)")
                }
            }
            .navigationTitle("MovieDB")
            .toolbar {
                Button("Add Samples", action: viewModel.addSamples)
                Button("Clear", action: viewModel.clear)
            }
        }
    }

    init(modelContext: ModelContext) {
        let viewModel = ViewModel(modelContext: modelContext)
        _viewModel = State(initialValue: viewModel)
    }
}
