//
//  PrintTypeView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/18.
//

import SwiftUI

struct PrintTypeView: View {
    var body: some View {
        Text("Hello World")
            .frame(width: 300, height: 100)
            .onTapGesture {
                print(type(of: self.body))
            }
        
    }
}
