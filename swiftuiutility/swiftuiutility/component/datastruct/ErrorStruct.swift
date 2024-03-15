//
//  ErrorStruct.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/15.
//

import SwiftUI

struct ErrorStruct: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func Errors(){
        fatalError("Counld not load the file")
    }
}

#Preview {
    ErrorStruct()
}
