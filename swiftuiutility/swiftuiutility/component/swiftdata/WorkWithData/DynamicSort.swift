//
//  DynamicSort.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/24.
//

import SwiftData
import SwiftUI

struct DynamicSort {
    @Model
    class User {
        var name: String
        var age: Int
        var city: String
        
        init(name: String, age: Int, city: String) {
            self.name = name
            self.age = age
            self.city = city
        }
    }
    
    
    struct ContentView: View {
        @State private var sortOrder = SortDescriptor(\User.name)
        
        var body: some View {
            NavigationStack {
                UserListingView(sort: sortOrder)
                
                Menu("Sort") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name")
                            .tag(SortDescriptor(\User.name))

                        Text("Age")
                            .tag(SortDescriptor(\User.age, order: .reverse))

                        Text("City")
                            .tag(SortDescriptor(\User.city))
                    }
                    .pickerStyle(.inline)
                }
            }
        }
    }
    
    struct UserListingView: View {
        @Query var users: [User]
        @Environment(\.modelContext) var modelContext

        var body: some View {
            List {
                ForEach(users) { user in
                    NavigationLink(value: user) {
                        Text("\(user.name) is \(user.age) years old")
                    }
                }
                .onDelete(perform: deleteUser)
            }
        }
        
        init(sort: SortDescriptor<User>) {
            //change the query object itself rather than the array inside it
            _users = Query(sort: [sort])
        }

        func deleteUser(_ indexSet: IndexSet) {
            for item in indexSet {
                let object = users[item]
                modelContext.delete(object)
            }
        }
    }
}
