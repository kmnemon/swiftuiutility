//
//  UsingRating.swift
//  swiftuiutility
//
//  Created by ke on 3/28/24.
//

import SwiftUI

struct UsingRating: View {
    @State private var rating = 3
    
    var body: some View {
        RatingView(rating: $rating)
    }
}

#Preview {
    UsingRating()
}
