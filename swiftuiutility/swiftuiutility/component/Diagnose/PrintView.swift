//
//  PrintTypeView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/18.
//

import SwiftUI

struct PrintView: View {
    var body: some View {
        //1. Print information
        let _ = print("information")
        
        
        
        //2. Print Type
        Button("Tap me") {
            print(type(of: Text("Hello, SwiftUI!")))
            print(type(of:
                        Button("Tap me"){}
                            .frame(width: 200)
                      ))
        }
    }
}
