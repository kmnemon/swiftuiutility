//
//  NavigationStackView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI

struct NavigationStackView: View {
    @State private var newWord = ""
    @State private var usedWords = [String]()
    @State private var platform = ""
    
    let platforms = ["nintedo", "playstation", "xbox"]
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    Text("Hello, World!")
                }
                
                Section{
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
                
                Section{
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                    ForEach(usedWords, id:\.self){ word in
                            Text(word)
                    }
                }
            }
            .navigationTitle(platform)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button("Calculate", systemImage: "plus", action: { () ->Void in })
            }
            .onSubmit {
                addNewWord()
            }
            .onAppear(perform: randomPlatform)
        }
    }
    
    func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {return}
        
        usedWords.insert(answer, at:0)
        newWord = ""
    }
    
    func randomPlatform(){
        platform = platforms.randomElement() ?? "Sega"
    }
}

#Preview {
    NavigationStackView()
}
