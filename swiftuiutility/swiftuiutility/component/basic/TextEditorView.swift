//
//  TextEditorView.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI

//Input multiple line of text
//Using TextEditor or TextField

struct TextEditorView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Section("TextEditor Example1"){
                    TextEditor(text: $notes)
                        .navigationTitle("Notes")
                        .padding()
                }
                
                Section("TextEditor Example2"){
                    Form{
                        TextEditor(text: $notes)
                            .navigationTitle("Notes")
                            .padding()
                    }
                }
                
                Section("TextField Example3") {
                    TextField("Enter you text", text: $notes, axis:  .vertical)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section("TextField Example4"){
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
