//
//  DatePickerView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/11.
//

import SwiftUI

struct DatePickerView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        DatePicker("please enter a date", selection: $wakeUp)
        
        DatePicker("please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()
        
        DatePicker("please enter a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
    }
}

#Preview {
    DatePickerView()
}
