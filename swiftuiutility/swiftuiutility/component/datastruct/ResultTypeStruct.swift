//
//  ResultType.swift
//  swiftuiutility
//
//  Created by ke on 4/7/24.
//

import SwiftUI

struct ResultTypeStruct: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings1()
            }
    }
    
    func fetchReadings1() async {
        do {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            output = "Found \(readings.count) readings"
        } catch {
            print("Download error")
        }
    }
    
    func fetchReadings2() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        
        do {
            output = try result.get()
        } catch {
            output = "Error: \(error.localizedDescription)"
        }
    }
    
    func fetchReadings3() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        
        switch result {
            case .success(let str):
                output = str
            case .failure(let error):
                output = "Error: \(error.localizedDescription)"
        }
    }
    
    //4.using result.get
    enum NetworkError: Error {
        case badURL
    }

    func createResult() -> Result<String, NetworkError> {
        return .failure(.badURL)
    }

    func usingResultGet() {
        let result = createResult()
        
        do {
            let successString = try result.get()
            print(successString)
        } catch {
            print("Oops! There was an error.")
        }
    }
    
    //5.create Result
    /*
     to create a Result value from throwing code – you’ll find that Result has an initializer that accepts a throwing closure. If the closure returns a value successfully that gets used for the success case, otherwise the thrown error is placed into the failure case.
     */
    func createresult() -> Result<String, Error> {
        let result = Result { try String(contentsOf: URL(string: "http://localhost:8080/stock-stream")!) }
        return result
    }
    
}

#Preview {
    ResultTypeStruct()
}
