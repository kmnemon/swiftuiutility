//
//  UnitTestWithSwiftDataTests.swift
//  swiftuiutility
//
//  Created by ke on 1/24/25.
//

import Testing
import SwiftData

@MainActor @Test func testAppStartsEmpty() throws {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: UnitTestWithSwiftData.Movie.self, configurations: config)
    
    let sut = ContentView4.ViewModel(modelContext: container.mainContext)
    
    #expect(sut.movies.count == 0)
}

@MainActor @Test func testCreatingSamplesWorks() throws {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: UnitTestWithSwiftData.Movie.self, configurations: config)
    
    let sut = ContentView4.ViewModel(modelContext: container.mainContext)
    sut.addSamples()
    
    #expect(sut.movies.count == 3)
}

@MainActor @Test func testCreatingAndClearingLeavesAppEmpty() throws {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: UnitTestWithSwiftData.Movie.self, configurations: config)
    
    let sut = ContentView4.ViewModel(modelContext: container.mainContext)
    sut.addSamples()
    sut.clear()
    
    #expect(sut.movies.count == 0)
}

//Do not need to make config, container, ViewModel in every test function
protocol ViewModelTestable {
    init(modelContext: ModelContext)
}

extension ContentView4.ViewModel: ViewModelTestable { }

@MainActor func make<T: ViewModelTestable>(viewModel: T.Type) throws -> T {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: UnitTestWithSwiftData.Movie.self, configurations: config)
    return T(modelContext: container.mainContext)
}

@MainActor func testCreatingSamplesWorks2() throws {
    let sut = try make(viewModel: ContentView4.ViewModel.self)

    sut.addSamples()

    #expect(sut.movies.count == 3)
}
