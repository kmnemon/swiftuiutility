//
//  TimeCurve.swift
//  swiftuiutility
//
//  Created by ke on 12/26/24.
//

import SwiftUI

struct TimeCurve:View {
    @State private var flag:Bool = false
    
    var body: some View {
        //speed
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .animation(.easeIn(duration: 1.0).speed(2.0), value: flag)
            .onTapGesture {
                flag.toggle()
            }
        
        //delay
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .animation(.easeIn(duration: 1.0).delay(2.0), value: flag)
            .onTapGesture {
                flag.toggle()
            }
        
        //repeatCount
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .animation(.easeIn(duration: 1.0).repeatCount(2), value: flag)
            .onTapGesture {
                flag.toggle()
            }
    }
}
