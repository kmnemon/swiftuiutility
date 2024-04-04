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
    
    @AppStorage("tapCount") var tapCount = 0
    
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
        
        Button("tap me") {
            sendRequestReview()
        }
    }
    
    @MainActor func sendRequestReview() {
        tapCount += 1

        if tapCount > 5 {
            requestReview()
        }
    }
}

#Preview {
    RequestReviewView()
}
