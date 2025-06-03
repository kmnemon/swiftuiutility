//
//  SplitView.swift
//  swiftuiutility
//
//  Created by ke Liu on 6/4/25.
//

import SwiftUI

struct SplitView: View {
    let names = ["Alice", "Bob", "Charlie"]
    
    var body: some View {
        HSplitView {
            List(names, id: \.self) { name in
                Text(name)
            }
            
            Text("Right")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
