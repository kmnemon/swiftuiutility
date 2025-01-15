//
//  TaskModifierDetail.swift
//  swiftuiutility
//
//  Created by ke on 1/16/25.
//

import SwiftUI

extension TaskModifierDetail {
    // A simple random number generator sequence
    struct NumberGenerator: AsyncSequence, AsyncIteratorProtocol {
        let range: ClosedRange<Int>
        let delay: Double = 1
        
        mutating func next() async -> Int? {
            // Make sure we stop emitting numbers when our task is cancelled
            while Task.isCancelled == false {
                try? await Task.sleep(for: .seconds(delay))
                print("Generating number")
                return Int.random(in: range)
            }
            
            return nil
        }
        
        func makeAsyncIterator() -> NumberGenerator {
            self
        }
    }
}
// This exists solely to show DetailView when requested.
struct TaskModifierDetail: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Start Generating Numbers") {
                DetailView()
            }
        }
    }
}

// This generates and displays all the random numbers we've generated.
struct DetailView: View {
    @State private var numbers = [String]()
    let generator = NumberGenerator(range: 1...1000)

    var body: some View {
        List(numbers, id: \.self, rowContent: Text.init)
            .task {
                await generateNumbers()
            }
    }

    func generateNumbers() async {
        for await number in generator {
            numbers.insert("\(numbers.count + 1). \(number)", at: 0)
        }
    }
}
