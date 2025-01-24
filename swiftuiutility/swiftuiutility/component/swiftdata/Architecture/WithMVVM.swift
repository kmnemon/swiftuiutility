//
//  MVVMWithSwiftData.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/24.
//

import SwiftData
import SwiftUI

struct WithMVVM {
    @Model
    class Movie {
        var title: String
        var cast: [String]
        
        init(title: String, cast: [String]) {
            self.title = title
            self.cast = cast
        }
    }
    
    //1. non-MVVM approach
    struct ContentView1: View {
        @Query(sort: \Movie.title) var movies: [Movie]
        @Environment(\.modelContext) var modelContext
        
        var body: some View {
            NavigationStack {
                List(movies) { movie in
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        
                        Text(movie.cast.formatted(.list(type: .and)))
                    }
                }
                .navigationTitle("MovieDB")
                .toolbar {
                    Button("Add Sample", action: addSample)
                }
            }
        }
        
        func addSample() {
            let movie = Movie(title: "Avatar", cast: ["Sam Worthington", "Zoe Saldaña", "Stephen Lang", "Michelle Rodriguez"])
            modelContext.insert(movie)
        }
    }
}



//2. MVVM
extension ContentView2 {
    @Observable
    class ViewModel {
        var modelContext: ModelContext
        var movies = [WithMVVM.Movie]()
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            fetchData()
        }
        
        func addSample() {
            let movie = WithMVVM.Movie(title: "Avatar", cast: ["Sam Worthington", "Zoe Saldaña", "Stephen Lang", "Michelle Rodriguez"])
            modelContext.insert(movie)
            fetchData()
        }
        
        func fetchData() {
            do {
                let descriptor = FetchDescriptor<WithMVVM.Movie>(sortBy: [SortDescriptor(\.title)])
                movies = try modelContext.fetch(descriptor)
            } catch {
                print("Fetch failed")
            }
        }
    }
}

struct ContentView2 {
    @State private var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.movies) { movie in
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                    
                    Text(movie.cast.formatted(.list(type: .and)))
                }
            }
            .navigationTitle("MovieDB")
            .toolbar {
                Button("Add Sample", action: viewModel.addSample)
            }
        }
    }
    
    init(modelContext: ModelContext) {
        let viewModel = ViewModel(modelContext: modelContext)
        _viewModel = State(initialValue: viewModel)
    }
}


//@main
struct MovieDBApp: App {
    let container: ModelContainer

    var body: some Scene {
        WindowGroup {
//            ContentView2(modelContext: container.mainContext)
        }
        .modelContainer(container)
    }

    init() {
        do {
            container = try ModelContainer(for: WithMVVM.Movie.self)
        } catch {
            fatalError("Failed to create ModelContainer for Movie.")
        }
    }
}
