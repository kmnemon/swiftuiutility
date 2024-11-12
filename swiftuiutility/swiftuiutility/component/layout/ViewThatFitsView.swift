//
//  ViewThatFitsView.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/12.
//

import SwiftUI

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
