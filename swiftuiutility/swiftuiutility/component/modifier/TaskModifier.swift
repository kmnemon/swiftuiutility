//
//  TaskModifier.swift
//  swiftuiutility
//
//  Created by ke on 1/16/25.
//

import SwiftUI

extension TaskModifier {
    struct Message: Decodable, Identifiable {
        let id: Int
        let user: String
        let text: String
    }
}

// 1. simpel Task
struct TaskModifier: View {
    @State private var messages = [Message]()

    var body: some View {
        NavigationStack {
            List(messages) { message in
                VStack(alignment: .leading) {
                    Text(message.user)
                        .font(.headline)

                    Text(message.text)
                }
            }
            .navigationTitle("Inbox")
            .task {
                await fetchData()
            }
        }
    }

    func fetchData() async {
        do {
            let url = URL(string: "https://hws.dev/inbox.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            messages = try JSONDecoder().decode([Message].self, from: data)
        } catch {
            messages = [
                Message(id: 0, user: "Failed to load inbox.", text: "Please try again later.")
            ]
        }
    }
}


