//
//  PrintTypeView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/18.
//

import SwiftUI

struct PrintTypeView: View {
    var body: some View {
        Button("Tap me") {
            print(type(of: Text("Hello, SwiftUI!")))
            print(type(of:
                        Button("Tap me"){}
                            .frame(width: 200)
                      ))
        }
    }
}
