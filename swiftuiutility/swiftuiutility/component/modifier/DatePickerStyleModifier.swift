//
//  DatePickerStyleModifier.swift
//  swiftuiutility
//
//  Created by ke Liu on 3/4/26.
//

import SwiftUI


struct DatePickerStyleModifier: View {
    @State private var dueDate = Date()
    
    var body: some View {
        DatePicker("", selection: $dueDate)
            .datePickerStyle(.graphical)
    }
}
