//
//  LayoutDiagnose.swift
//  swiftuiutility
//
//  Created by ke on 12/1/24.
//

import SwiftUI

struct LayoutDiagnose: View {
    var body: some View {
        VStack {
            Text("hello")
        }
        .padding(40)
        .border(Color.red)
        .overlay {
            GeometryReader { proxy in
                HStack {
                    Text("\(Int(proxy.size.width)) * \(Int(proxy.size.height))")
                        .font(.footnote)
                }
            }
        }
    }
}

