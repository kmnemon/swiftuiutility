//
//  StringStruct.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/15.
//

import SwiftUI

struct StringStruct: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func testStrings(){
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        
        let intput2 = """
        a
        b
        c
        """
        let letters2 = intput2.components(separatedBy: "\n")
        
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //UI kit
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound

    }
}

#Preview {
    StringStruct()
}
