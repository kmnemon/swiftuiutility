//
//  EnumsView.swift
//  swiftuiutility
//
//  Created by ke on 4/5/24.
//

import SwiftUI

extension EnumsView {
    struct LoadingView: View {
        var body: some View {
            Text("Loading...")
        }
    }
    
    struct SuccessView: View {
        var body: some View {
            Text("Success!...")
        }
    }
    
    struct FailedView: View {
        var body: some View {
            Text("Failed.")
        }
    }
}

struct EnumsView: View {
    enum LoadingState {
        case loading, success, failed
    }
    
    @State private var loadingState = LoadingState.loading
    
    var body: some View {
        switch loadingState {
            case .loading:
                LoadingView()
            case .success:
                SuccessView()
            case .failed:
                FailedView()
        }
    }
}

#Preview {
    EnumsView()
}
