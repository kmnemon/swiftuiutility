//
//  AlertView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/10.
//

import SwiftUI

extension AlertModifier {
    struct User {
        var name: String
    }
}

struct AlertModifier: View {
    @State private var showingAlert = false
    
    @State private var user: User?
    @State private var showingAlert2 = false
    
    var body: some View {
        Button("show alert"){
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("OK"){}
            Button("Continue", action: { () ->Void in })
            Button("Delete", role: .destructive){ 
                //action
            }
            Button("Cancel", role: .cancel){}
        } message: {
            Text("Please read this")
        }   
        
        Button("binding to an optional") {
            showingAlert2 = true
        }
        .alert(user?.name ?? "ke", isPresented: $showingAlert2, presenting: user) { _ in
        } message: { u in
            Text(u.name)
        }
    }
}

#Preview {
    AlertModifier()
}
