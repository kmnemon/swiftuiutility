//
//  PreferencesValue.swift
//  swiftuiutility
//
//  Created by ke Liu on 4/10/25.
//

import SwiftUI

/*
 We’ve seen how SwiftUI’s environment flows downwards, but sometimes
 you want information to flow upwards too – to send data from a child view
 upwards to its ancestor views
 */

struct WidthPreferenceKey: PreferenceKey {
    static let defaultValue = 0.0
    //take the first value
//    static func reduce(value: inout Double, nextValue: () -> Double) {
//    }
    //take the last value
    static func reduce(value: inout Double, nextValue: () -> Double) {
        value = nextValue()
    }
}

struct SizingView: View {
    @State private var width = 50.0
    
    var body: some View {
        Color
            .red
            .frame(width: width, height: 100)
            .onTapGesture {
                width = Double.random(in: 50...160)
            }
            .preference(key: WidthPreferenceKey.self, value: width)
    }
}

struct PreferencesValue: View {
    @State private var width = 0.0
    
    var body: some View {
        NavigationStack {
            VStack {
                SizingView()
            }
            .onPreferenceChange(WidthPreferenceKey.self) {
                width = $0 }
            .navigationTitle("Width: \(width)")
        }
    }
}
