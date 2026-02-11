//
//  AspectRatio.swift
//  swiftuiutility
//
//  Created by ke Liu on 2/11/26.
//

import SwiftUI

struct AspectRatio: View {
    var body: some View {
        Color.secondary
            .aspectRatio(4/3, contentMode: .fit)
            //.scaledToFit() shorthand for above
        
        Color.secondary
            .aspectRatio(4/3, contentMode: .fill)
            //.scaledToFill()
        
    }
}
