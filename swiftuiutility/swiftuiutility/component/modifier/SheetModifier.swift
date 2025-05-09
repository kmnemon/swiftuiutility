//
//  SheetView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/15.
//

import SwiftUI

extension SheetModifier {
    struct Person: Identifiable{
        var id: UUID
        var firstName: String
        var lastName: String
    }
}

extension SheetModifier {
    struct SecondView: View {
        @Environment(\.dismiss) var dismiss
        
        var name: String = ""
        
        var body: some View {
            Text("Hello, \(name)!")
            Button("Dismiss"){
                dismiss()
            }
        }
    }
}



struct SheetModifier: View {
    @State private var showingSheet = false
    @State private var showingSheet2 = false
    @State private var person: Person?
    
    
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
                person = Person(id: UUID(), firstName: "eden", lastName: "z")
            }
            .sheet(item: $person) { p in
                SecondView(name: p.firstName)
            }
            .padding()
            
            Button("action on dismiss") {
                showingSheet2 = true
            }
            .sheet(isPresented: $showingSheet2, onDismiss: dis) {
                SecondView.init()
            }
            .padding()
            
            Button("action on dismiss") {
                showingSheet2 = true
            }
            .sheet(isPresented: $showingSheet2, onDismiss: dis, content: SecondView.init)
            .padding()
        }
        
    }
    
    
    func dis(){
        print("call dismiss")
    }
}

#Preview {
    SheetModifier()
}
