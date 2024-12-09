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
