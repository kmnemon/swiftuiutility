//
//  ContainerRelaiveFrameModifier.swift
//  swiftuiutility
//
//  Created by ke on 11/11/24.
//

import SwiftUI

struct ContainerRelaiveFrameModifier: View {
    var body: some View {
        VStack {
            Image(.zeldaBotwLogo2X)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { width, axis in
                    width * 0.6
                }
        }
    }
}
