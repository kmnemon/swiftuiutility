//
//  GroupBoxView.swift
//  swiftuiutility
//
//  Created by ke Liu on 3/8/26.
//

import SwiftUI

struct GroupBoxView: View {
    var body: some View {
        GroupBox("Details") {
            LabeledContent("Population") {
                Text(1, format: .number)
            }
            LabeledContent("Capital") {
                Text("test")
            }
        }
    }
}
