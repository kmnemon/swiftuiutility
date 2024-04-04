//
//  AlertView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/10.
//

import SwiftUI

struct AlertModifier: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("show alert"){
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert){
            Button("OK"){}
            Button("Continue", action: { () ->Void in })
            Button("Delete", role: .destructive){ 
                //action
            }
            Button("Cancel", role: .cancel){}
        } message: {
            Text("Please read this")
        }        
    }
}

#Preview {
    AlertModifier()
}
