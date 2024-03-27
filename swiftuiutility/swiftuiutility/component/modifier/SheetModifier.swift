//
//  SheetView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/15.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Text("Hello, \(name)!")
        Button("Dismiss"){
            dismiss()
        }
    }
}

struct SheetModifier: View {
    @State private var showingSheet = false
    
    
    var body: some View {
        NavigationStack{
            Button("Show Sheet"){
                showingSheet.toggle()
            }
            .toolbar{
                Button("Add expense", systemImage: "plus"){
                    showingSheet = true
                }
            }
            .sheet(isPresented: $showingSheet){
                SecondView(name: "peter")
            }
   
        }
    }
}

#Preview {
    SheetModifier()
}
