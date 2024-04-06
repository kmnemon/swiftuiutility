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

struct PersonName: Identifiable{
    var id: UUID
    var firstName: String
    var lastName: String
}

struct SheetModifier: View {
    @State private var showingSheet = false
    @State private var personName: PersonName?
    
    
    var body: some View {
        NavigationStack{
            Button("Show Sheet") {
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
            .padding()
            
            Button("Show Sheet with item") {
                personName = PersonName(id: UUID(), firstName: "eden", lastName: "z")
            }
            .sheet(item: $personName) { p in
                SecondView(name: p.firstName)
            }
            .padding()
   
        }
    }
}

#Preview {
    SheetModifier()
}
