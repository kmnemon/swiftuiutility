//
//  MultiplePlatform.swift
//  swiftuiutility
//
//  Created by ke Liu on 4/11/25.
//

import SwiftUI

public extension View {
    func watchOS<Content: View>(_ modifier: @escaping (Self) -> Content) -> some View {
#if os(watchOS)
        modifier(self)
#else
        self
#endif
    }
}


struct MultiplePlatform: View {
    var body: some View {
        Text("Hello, world!")
            .watchOS {
                $0.padding(0)
            }
    }
}
