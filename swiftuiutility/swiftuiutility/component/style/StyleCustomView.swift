//
//  StyleCustomView.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/25.
//

import SwiftUI

//not finished yet
struct RangeSlider<Label: View>: View {
    var range: ClosedRange<Double>
    
    var bounds: ClosedRange<Double>?
    
    var label: Label
    
    init(value: Binding<ClosedRange<Double>>, in bounds: ClosedRange<Double>? = nil, @ViewBuilder label: () -> Label) {
        self.range = value.wrappedValue
        self.bounds = bounds
        self.label = label()
    }
    
    var body: some View {
        LabeledContent {
            // ...
        } label: {
            label
        }
    }
}
