//
//  ImageInterpolationView.swift
//  swiftuiutility
//
//  Created by ke on 4/7/24.
//

import SwiftUI

struct ImageInterpolationView: View {
    var body: some View {
        Image(.mashroom)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    ImageInterpolationView()
}
