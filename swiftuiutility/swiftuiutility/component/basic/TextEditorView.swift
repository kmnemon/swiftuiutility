//
//  TextEditorView.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI

struct TextEditorView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Section("1"){
                    TextEditor(text: $notes)
                        .navigationTitle("Notes")
                        .padding()
                }
                
                Section("2"){
                    Form{
                        TextEditor(text: $notes)
                            .navigationTitle("Notes")
                            .padding()
                    }
                }
                
                Section("3") {
                    TextField("Enter you text", text: $notes, axis:  .vertical)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section("4"){
                    Form{
                        TextField("Enter you text", text: $notes, axis:  .vertical)
                            .textFieldStyle(.roundedBorder)
                    }
                }
            }
        }
    }
}

#Preview {
    TextEditorView()
}
