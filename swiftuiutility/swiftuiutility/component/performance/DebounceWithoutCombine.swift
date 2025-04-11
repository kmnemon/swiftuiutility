//
//  DebounceWithoutCombine.swift
//  swiftuiutility
//
//  Created by ke Liu on 4/11/25.
//

import SwiftUI

@Observable
class ViewModel {
    private var refreshTask: Task<Void, Error>?
    var workCounter = 0
    
    func doWorkNow() {
        workCounter += 1
        print("Work done: \(workCounter)")
    }
    
    func scheduleWork() {
        refreshTask?.cancel()
        
        refreshTask = Task {
            try await Task.sleep(until: .now + .seconds(3), clock: .continuous)
            doWorkNow()
        }
    }
}


struct DebounceWithoutCombine: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Button("Do Work Soon", action:
                    viewModel.scheduleWork)
            Button("Do Work Now", action:
                    viewModel.doWorkNow)
        }
    }
}
