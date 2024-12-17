//
//  ViewThatFitsView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/12.
//

import SwiftUI

/*
 When we want to display diﬀerent views depending on the proposed size, we can use
 ViewThatFits. It takes a number of subviews, and it displays the first subview that fits.
 It does so by proposing nil to figure out the ideal size for each subview, and it displays
 the first subviews (in the order the subviews appear in the code) where the ideal size
 fits within the proposed size. If none of the subviews fit, it picks the last subview
 */

struct ViewThatFitsView: View {
    var body: some View {
        ViewThatFits {
            Rectangle()
                .frame(width: 500, height: 200)
            
            Circle()
                .frame(width: 200, height: 200)
        }
    }
}
