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

class Zoo: Codable {
    var animal = "ape"
}

@Observable
class Juice: Codable{
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    
    var name = "lemonade"
}


struct JsonView: View {
    var body: some View {
        Button("Encode JSON") {
            let address = Address(street: "avenue", city: "cc")
            
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(address){
                print(data)
            }
        }
        
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
        
        Button("encodeAndDecode") {
            let data = try! JSONEncoder().encode(Zoo())
            let str = String(decoding: data, as: UTF8.self)
            print(str)
        }
        
        Button("encodeAndDecodeObservable"){
            let data = try! JSONEncoder().encode(Juice())
            let str = String(decoding: data, as: UTF8.self)
            print(str)
        }
    }
}

#Preview {
    JsonView()
}
