//
//  TagModifier.swift
//  swiftuiutility
//
//  Created by ke on 3/31/24.
//

import SwiftUI

struct TagModifier: View {
    @State private var sortOrder: [String] = [""]
    @State private var users = [ToolbarItemView.User]()
    @State private var selectedUsers = Set<ToolbarItemView.User>()
    
    var body: some View {
        Section("1.With Picker:") {
            Picker("Sort", selection: $sortOrder) {
                Text("Sort by Name")
                    .tag([
                        "Name"
                    ])
                Text("Sort by Join Date")
                    .tag([
                        "Date"
                    ])
            }
            
            Text("Your choose is: \(sortOrder[0])")
        }
        
        Spacer()
        Spacer()
        Spacer()
        
        Section("2.With List:") {
            NavigationStack{
                List(users, selection: $selectedUsers){ user in
                    Text(user.name)
                        .tag(user)
                }
                .navigationTitle("Books")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add", systemImage: "plus"){
                            let user = ToolbarItemView.User(name: "ke")
                            users.append(user)
                        }
                    }
                    
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
            }
        }
       
    }
}

#Preview {
    TagModifier()
}
