//
//  ListRowBackgroundModifier.swift
//  swiftuiutility
//
//  Created by ke Liu on 3/17/26.
//

import SwiftUI

struct ListRowBackgroundModifier: View {
    var body: some View {
        Text("nintendo game")
            .font(.title.weight(.black).italic())
            .foregroundStyle(.white)
            .shadow(radius: 10)
            .padding(24)
            .padding(.bottom, 240)
            .listRowBackground(Image(.tony1))
    }
}

#Preview {
    return List {
        ListRowBackgroundModifier()
    }
}
