//
//  LongLiveStreamView.swift
//  swiftuiutility
//
//  Created by ke on 2024/8/12.
//
// using the go service network/longlive.go
import SwiftUI
/*
 Asynchronous sequences - The hook of asynchronous sequences is that you can iterate over their elements asynchronously as more and more elements become available over time.
 */

extension String: Error { }

struct Stock: Hashable, Codable {
    let name: String
    let value: Double
}

struct LongLiveStreamView: View {
    @State private var vm = LongLiveViewModel()
    
    @State var lastErrorMessage = "" {
      didSet { isDisplayingError = true }
    }
    
    @State var isDisplayingError = false
    
    var body: some View {
        HStack {
                HStack {
                    Text(vm.stock.name)
//                    Spacer()
//                      .frame(maxWidth: .infinity)
                    Text(String(format: "%.3f", arguments: [vm.stock.value]))
                }
            
        }
        .alert("Error", isPresented: $isDisplayingError, actions: {
          Button("Close", role: .cancel) { }
        }, message: {
          Text(lastErrorMessage)
        })
        .task {
            do {
                try await vm.availableStocks()
            } catch{
                lastErrorMessage = error.localizedDescription
            }
        }
       
    }
}

//using MainActor to make sure code can run on the mainthread, because the code value is used to update UI
@Observable @MainActor
class LongLiveViewModel {
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


#Preview {
    LongLiveStreamView()
}
