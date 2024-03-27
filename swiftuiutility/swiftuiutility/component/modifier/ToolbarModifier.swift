//
//  ToolbarModifier.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI

struct ToolbarModifier: View {
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack{
            Text("?")
                .navigationTitle("Books")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add", systemImage: "plus"){
                            showingAddScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen){
                    //View()
                }
        }
    }
}

#Preview {
    ToolbarModifier()
}
