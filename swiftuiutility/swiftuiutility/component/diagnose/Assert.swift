//
//  Assert.swift
//  swiftuiutility
//
//  Created by ke Liu on 4/11/25.
//

import SwiftUI

extension View {
    public func assert(
        _ condition: @autoclosure () -> Bool,
        _ message: @autoclosure () -> String = String(),
        file: StaticString = #file, line: UInt = #line
    ) -> some View {
        Swift.assert(condition(), message(), file: file, line: line)
        return self
    }
}

struct Assert: View {
    @State private var counter = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    //3. assert
    var body: some View {
        Text("Example View Here")
            .onReceive(timer) { _ in
                counter += 1
            }
            .assert(counter < 10, "Timer exceeded")
    }
}
