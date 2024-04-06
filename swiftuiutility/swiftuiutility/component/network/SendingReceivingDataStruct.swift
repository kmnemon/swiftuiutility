//
//  SendingReceivingDataStruct.swift
//  swiftuiutility
//
//  Created by ke on 3/20/24.
//

import SwiftUI


extension SendingReceivingDataStruct  {
    struct Response: Codable{
        var results: [Result]
    }
    
    struct Result: Codable{
        var trackId: Int
        var trackName: String
        var collectionName: String
    }
}

struct SendingReceivingDataStruct: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId){ item in
            VStack(alignment: .leading){
                Text(item.trackName)
                    .font(.headline)
                
                Text(item.collectionName)
            }
        }
        .task{
            await loadData()
        }
    }
    
    func loadData() async{
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else{
            print("Invalid URL")
            return
        }
        
        do {
            let(data, _) = try await URLSession.shared.data(from: url)
            
            if let decodeResponse = try? JSONDecoder().decode(Response.self, from: data){
                results = decodeResponse.results
            }
        } catch{
            print("Invalid data")
        }
    }
}

#Preview {
    SendingReceivingDataStruct()
}
