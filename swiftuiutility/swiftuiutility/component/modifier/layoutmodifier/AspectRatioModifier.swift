//
//  AspectRatioModifier.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/5.
//

import SwiftUI
/*
 The aspectRatio modifier will compute a rectangle with an aspect ratio of 4/3 that fits
 into the proposed size and then propose that to its subview. To the parent view, it
 always reports the size of its subview, regardless of the proposed size or the specified
 aspect ratio.
 */
struct AspectRatioModifier: View {
    var body: some View {
        Color.secondary
            .aspectRatio(4/3, contentMode: .fit)
                                        //.fill
        
        Image(.zeldaBotwLogo2X)
            .resizable()
            .scaledToFit() //this is the shorthand for .aspectRatio(contentMode:)
            //.aspectRatio(contentMode: .fit)
    }
}
