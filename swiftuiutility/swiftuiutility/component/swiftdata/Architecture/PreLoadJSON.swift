//
//  PreLoadJSON.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/24.
//

import SwiftData
import SwiftUI
/*
 1. Create your JSON file, either by hand or using some sort of tool.
 2. Add that to your project, making sure to add it to your target.
 3. Design your SwiftData model to match the data in your JSON file.
 4. Make your SwiftData model conform to Codable.
 5. Use the onSetup closure of the modelContainer() modifier to perform your initial set up.
 */

//1.JSON file
/*
 [
     {
         "name": "Monkey D. Luffy"
     },
     {
         "name": "Roronoa Zoro,"
     },
     {
         "name": "Nami"
     },
 ]
 */


struct PreLoadJSON {
    //3.4.
    @Model
    class User: Codable {
        enum CodingKeys: CodingKey {
          case name
        }

        var name: String

        init(name: String) {
            self.name = name
        }

        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decode(String.self, forKey: .name)
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(name, forKey: .name)
        }
    }
    
    //5.
    /*
     WindowGroup {
         ContentView()
     }
     .modelContainer(for: User.self) { result in
         do {
             let container = try result.get()

             // Check we haven't already added our users.
             let descriptor = FetchDescriptor<User>()
             let existingUsers = try container.mainContext.fetchCount(descriptor)
             guard existingUsers == 0 else { return }

             // Load and decode the JSON.
             guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
                 fatalError("Failed to find users.json")
             }

             let data = try Data(contentsOf: url)
             let users = try JSONDecoder().decode([User].self, from: data)

             // Add all our data to the context.
             for user in users {
                 container.mainContext.insert(user)
             }
         } catch {
             print("Failed to pre-seed database.")
         }
     }
     */
}
