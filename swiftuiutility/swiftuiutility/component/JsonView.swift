//
//  JsonView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct JsonView: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
        {
            "name": "kmnemon Swift",
            "address": {
                "street": "555, Swift Avenue",
                "city": "Nashville"
            }
        }
        """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

#Preview {
    JsonView()
}
