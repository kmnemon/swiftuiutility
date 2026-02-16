//
//  GeometryReaderView7.swift
//  swiftuiutility
//
//  Created by ke on 12/31/24.
//

import SwiftUI

//example: measure the size of a single view and propagate the measurement to an ancestor
//measure the text proposed size and using onChange propagate tooWide to the .border ancestor view



struct GeometryReaderViewWithAncestor: View {
    var text: String
    @State private var overflows: Bool = false
    
    var body: some View {
        Text(text)
            .fixedSize()
            .overlay {
                GeometryReader { proxy in
                    let tooWide = proxy.size.width > 100
                    Color.clear
//                        .onAppear {
//                            overflows = tooWide
//                        }
                        .onChange(of: tooWide, initial: true) {
                            overflows = tooWide
                        }
                }
                
            }
            .frame(width: 100)
            .border(overflows ? Color.red : Color.clear)
    }
}

//add helper function, not necessary in iOS 17
extension View {
    func onAppearOrChange<Value: Equatable>(of value: Value, perform: @escaping (Value) -> ()) -> some View
    {
        self
//            .onAppear { perform(value) }
            .onChange(of: value, initial: true) { perform(value) }
    }
}

struct GeometryReaderViewWithAncestor2: View {
    var text: String
    @State private var overflows: Bool = false
    
    var body: some View {
        Text(text)
            .fixedSize()
            .overlay {
                GeometryReader { proxy in
                    let tooWide = proxy.size.width > 100
                    Color.clear
                        .onAppearOrChange(of: tooWide) { value in
                            overflows = value
                        }
                }
                
            }
            .frame(width: 100)
            .border(overflows ? Color.red : Color.clear)
    }
}
