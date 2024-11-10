//
//  TimerView.swift
//  swiftuiutility
//
//  Created by ke on 4/8/24.
//

import SwiftUI

struct TimerView: View {
    //timer concept(timer coalescent):you can specify some tolerance, this allow IOS to perform important energy optimazation,it means it can fire your timer at any point between its scheduled fire time and it scheduled fire time plus that tolerance value.
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
