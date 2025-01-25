//
//  Singleton.swift
//  swiftuiutility
//
//  Created by ke on 1/25/25.
//

import SwiftData
import SwiftUI


@Model class AppSettings {
    var name: String
    var location: String
    var selectedTopics: [String]

    init(name: String, location: String, selectedTopics: [String]) {
        self.name = name
        self.location = location
        self.selectedTopics = selectedTopics
    }
}


struct Singleton {
    struct ContentView: View {
        @Environment(\.modelContext) var modelContext
        @State private var settings: AppSettings?

        var body: some View {
            NavigationStack {
                VStack {
                    if let settings {
                        Text("Name: \(settings.name)")
                        Text("Location: \(settings.location)")
                        Text("Topics: \(settings.selectedTopics.formatted(.list(type: .and)))")
                    } else {
                        Text("Loading…")
                    }
                }
                .navigationTitle("Singletons")
                .onAppear(perform: load)
            }
        }

        func load() {
            let request = FetchDescriptor<AppSettings>()
            let data = try? modelContext.fetch(request)
            settings = data?.first ?? AppSettings(name: "Anonymous", location: "Unknown", selectedTopics: ["Latest News"])
        }
    } 
}
