//
//  JsonAdvancedView.swift
//  swiftuiutility
//
//  Created by ke on 4/1/24.
//

import SwiftUI

//1.Ask Swift to convert property names automatically
//2.Creating custom property anme conversions
//3.Creating completely custom encoding and decoding

//1.
struct Pet: Codable {
    var firstName: String
    var lastName: String
}

//2.
struct Pet2: Codable {
    enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
    }
    
    var firstName: String
    var lastName: String
}

//3.
struct Pet3: Codable {
    enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
        case age
    }
    
    var firstName: String
    var lastName: String
    var age: Int
    
    //if this is class, the initializer need to be marked with required so that any subclasses are required to implement it.
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        let stringAge = try container.decode(String.self, forKey: .age)
        self.age = Int(stringAge) ?? 0
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.firstName, forKey: .firstName)
        try container.encode(self.lastName, forKey: .lastName)
        try container.encode(String(self.age), forKey: .age)
    }
}

struct JsonAdvancedView: View {
    let str = """
{
        "first_name" : "Andrew",
        "last_name" : "Glouberman"
}
"""
    
    let str2 = """
        "first" : "Andrew",
        "last" : "Glouberman"
"""
    
    let str3 = """
        "first" : "Andrew",
        "last" : "Glouberman"
        "age" : "13"
"""
    
    
    var body: some View {
        Button("Convert property names automatically") {
            let data = Data(str.utf8)
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let pet = try decoder.decode(Pet.self, from: data)
                print("Hi, Im \(pet.firstName) \(pet.lastName)")
            } catch {
                print("Whoops: \(error.localizedDescription)")
            }
        }
        
        Button("Create Custom property name conversions") {
            let data = Data(str2.utf8)
            do {
                let decoder = JSONDecoder()
                
                let pet2 = try decoder.decode(Pet2.self, from: data)
                print("Hi, Im \(pet2.firstName) \(pet2.lastName)")
            } catch {
                print("Whoops: \(error.localizedDescription)")
            }
        }
        
        Button("Completely custom codable implementations") {
            
        }
    }
}

#Preview {
    JsonAdvancedView()
}
