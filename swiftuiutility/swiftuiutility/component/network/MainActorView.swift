//
//  MainActorView.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/3.
//

import SwiftUI


/*
 1. MainActor.run
 is used to execute a block of code on the main thread. This is particularly useful when you need to update the UI from a background thread, as UI updates must always occur on the main thread.
*/

struct MainActorView: View {
    @State private var message = "Hello, World!"
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .padding()
            
            Button("Update Message") {
                updateMessage()
            }
        }
    }
    
    func updateMessage() {
        // Simulate a background task
        DispatchQueue.global(qos: .background).async {
            // Simulating a delay for background work
            sleep(2)
            
            // Use MainActor to ensure the UI update happens on the main thread
            Task {
                await MainActor.run {
                    self.message = "Message updated from background!"
                }
            }
        }
    }
}



/*
 2. MainActor class
 for model classes that drive your UI, you might as well assign all your model code to run on the main actor.
*/

@Observable @MainActor
class LongLiveViewModel2 {
    var stock: Stock = Stock(name: "default", value: 1.0)

    private var liveURLSession: URLSession = {
      var configuration = URLSessionConfiguration.default
      configuration.timeoutIntervalForRequest = .infinity
      return URLSession(configuration: configuration)
    }()
    
    func availableStocks() async throws{
        guard let url = URL(string: "http://localhost:8080/stock-stream")
        else {
            throw "The URL could not be created"
        }
        
        let (stream, response) = try await liveURLSession.bytes(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
          throw "The server responded with an error."
        }
        
        for try await line in stream.lines {
            self.stock = try JSONDecoder()
            .decode(Stock.self, from: Data(line.utf8))
            print("Updated: \(Date())")
        }
    }
}
