//
//  ToolbarItemView.swift
//  swiftuiutility
//
//  Created by ke on 4/7/24.
//

import SwiftUI

extension ToolbarItemView {
    struct User: Hashable, Identifiable {
        var id = UUID()
        var name: String
        
        init(name: String) {
            self.name = name
        }
    }
}

struct ToolbarItemView: View {
    @State private var showingAddScreen = false
    @State private var users = [User]()
    @State private var selectedUsers = Set<User>()
    
    var body: some View {
        NavigationStack{
            List(users, selection: $selectedUsers){ user in
                Text(user.name)
                    .tag(user)
            }
            .navigationTitle("Books")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Show"){
                        showingAddScreen.toggle()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus"){
                        let user = User(name: "ke")
                        users.append(user)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddScreen){
                //View()
            }
        }
    }
}

#Preview {
    ToolbarItemView()
}
