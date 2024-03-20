//
//  FormView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI

struct FormView: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                Text("Hello, World!")
            }
             
            Section {
                Text("Hello, World!")
                Text("Hello, World!")
            }
        }
        
        Form {
            Section{
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account"){
                    print("Creating account...")
                }
            }
//            .disabled(username.isEmpty || email.isEmpty)
            .disabled(disableForm)
            
        }
    }
}

#Preview {
    FormView()
}
