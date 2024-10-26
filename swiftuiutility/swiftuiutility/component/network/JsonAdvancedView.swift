//
//  JsonAdvancedView.swift
//  swiftuiutility
//
//  Created by ke on 4/1/24.
//

import SwiftUI

//Option 1.Ask Swift to convert property names automatically
//Option 2.Creating custom property anme conversions
//Option 3.Creating completely custom encoding and decoding

extension JsonAdvancedView {
    //Option 1.  camel case <-> snake case
    struct Pet: Codable {
        var firstName: String
        var lastName: String
    }
    
    func encodingJson() {
        let pet = Pet(firstName: "alnrod", lastName: "lee")
        
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        if let data = try? encoder.encode(pet){
            printJSONString(from: data)
        }
    }
    
    func decodingJson() {
        let str = """
    {
            "first_name" : "Andrew",
            "last_name" : "Glouberman"
    }
    """
        
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
}





extension JsonAdvancedView {
    //2.
    struct Pet2: Codable {
        enum CodingKeys: String, CodingKey {
            case firstName = "first"
            case lastName = "last"
        }
        
        var firstName: String
        var lastName: String
    }
    
    func encodingJson2() {
        let pet2 = Pet2(firstName: "alnrod", lastName: "lee")
        
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(pet2){
            printJSONString(from: data)
        }
    }
    
    func decodingJson2() {
        let str2 = """
    {
            "first" : "Andrew",
            "last" : "Glouberman"
    }
    """
        
        let data = Data(str2.utf8)
        do {
            let decoder = JSONDecoder()
            
            let pet2 = try decoder.decode(Pet2.self, from: data)
            print("Hi, Im \(pet2.firstName) \(pet2.lastName)")
        } catch {
            print("Whoops: \(error.localizedDescription)")
        }
    }
}


extension JsonAdvancedView {
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
        
        init(firstName: String, lastName: String, age: Int) {
            self.firstName = firstName
            self.lastName = lastName
            self.age = age
        }
        
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
    
    func encodingJson3() {
        let pet3 = Pet3(firstName: "alnrod", lastName: "lee", age: 10)
        
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(pet3){
            printJSONString(from: data)
        }
    }
    
    func decodingJson3() {
        let str3 = """
    {
            "first" : "Andrew",
            "last" : "Glouberman",
            "age" : "13"
    }
    """
        
        let data = Data(str3.utf8)
        do {
            let decoder = JSONDecoder()
            
            let pet3 = try decoder.decode(Pet3.self, from: data)
            print("Hi, Im \(pet3.firstName) \(pet3.lastName)")
        } catch {
            print("Whoops: \(error.localizedDescription)")
        }
    }
}

extension JsonAdvancedView {
    func printJSONString(from data: Data) {
        if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
           let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
        } else {
            print("Invalid JSON data")
        }
    }
}




struct JsonAdvancedView: View {
    var body: some View {
        Button("1.Convert property names automatically") {
            encodingJson()
            decodingJson()
        }
        
        Button("Create Custom property name conversions") {
            encodingJson2()
            decodingJson2()
        }
        
        Button("Completely custom codable implementations") {
            encodingJson3()
            decodingJson3()
        }
    }
}

#Preview {
    JsonAdvancedView()
}
