//
//  DateComponents.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/12.
//

import SwiftUI

struct DateComponentsStruct: View {
    @State private var wakeUp = defaultWakeTime

    static var defaultWakeTime: Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    
    var body: some View {
        Text(Date.now, format: .dateTime.hour().minute())
        Text(Date.now, format: .dateTime.day().month().year())
        Text(Date.now.formatted(date: .long, time: .shortened))
        Text(wakeUp.formatted(date: .omitted, time: .shortened))
    }
    
    func exampleDates1(){
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
    
    //DateComponents
    func exampleDates2(){
        //example1
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now
        
        //example2
        let components2 = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}

#Preview {
    DateComponentsStruct()
}
