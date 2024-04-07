//
//  TimerView.swift
//  swiftuiutility
//
//  Created by ke on 4/8/24.
//

import SwiftUI

struct TimerView: View {
    //tolerance energy saving
    let timer = Timer.publish(every: 1, tolerance: 0.5 ,on: .main, in: .common).autoconnect()
    @State private var count = 0
    
    var body: some View {
        Text("Hello, World!")
            .onReceive(timer) { time in
                if count == 5 {
                    cancelTimer()
                } else {
                    print("The time is now \(time)")
                }
                
                count += 1
            }
    }
    
    func cancelTimer() {
        timer.upstream.connect().cancel()
    }
}

#Preview {
    TimerView()
}
