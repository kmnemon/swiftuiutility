//
//  LabelView.swift
//  swiftuiutility
//
//  Created by ke Liu on 3/13/26.
//

import SwiftUI

struct LabelView: View {
    var body: some View {
        Label {
            VStack(alignment: .leading) {
                Text("mok")
                    .font(.title2.width(.condensed).bold())
            }
        } icon: {
            Image(.tony1)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .cornerRadius(8)
            
        }
    }
}
