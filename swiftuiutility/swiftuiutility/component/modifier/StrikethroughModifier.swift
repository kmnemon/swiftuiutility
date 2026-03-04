//
//  StrikethroughModifier.swift
//  swiftuiutility
//
//  Created by ke Liu on 3/4/26.
//

import SwiftUI

struct StrikethroughModifier: View {
    var body: some View {
        Text("strikethrough")
            .strikethrough(true, color: .red)
    }
}
