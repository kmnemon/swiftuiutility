//
//  swiftuiutilityApp.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI
import SwiftData

@main
struct swiftuiutilityApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //a model container is swiftdata's name for where it stores its data
        .modelContainer(for: StudentData.self)
    }
}
