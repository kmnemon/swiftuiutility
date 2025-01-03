//
//  DispatchQueueView.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/3.
//

import SwiftUI

/*
 In SwiftUI, DispatchQueue is used to manage asynchronous operations, typically when you're working with background tasks or need to perform actions on different threads. Since UI updates must always happen on the main thread, DispatchQueue can be used to switch between background threads and the main thread.
 */

struct DispatchQueueView: View {
    @State private var message = "Hello, World!"
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .padding()
            
            Button("Update Message") {
                updateMessage()
            }
        }
    }
    
    func updateMessage() {
        // Simulate a background task
        DispatchQueue.global(qos: .background).async {
            // Simulating a long-running task
            sleep(2) // Simulate a 2-second delay
            
            // Switch back to the main thread to update the UI
            DispatchQueue.main.async {
                self.message = "Message updated from background!"
            }
        }
    }
}
