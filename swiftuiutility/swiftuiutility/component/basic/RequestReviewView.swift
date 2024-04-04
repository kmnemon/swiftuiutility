//
//  RequestReviewView.swift
//  swiftuiutility
//
//  Created by ke on 4/4/24.
//

import SwiftUI
import StoreKit

struct RequestReviewView: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    RequestReviewView()
}
