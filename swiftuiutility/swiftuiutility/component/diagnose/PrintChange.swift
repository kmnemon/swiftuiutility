//
//  PrintChange.swift
//  swiftuiutility
//
//  Created by ke Liu on 4/11/25.
//

import SwiftUI

extension View {
    func debugPrint(_ value: @autoclosure () -> Any) -> some View {
#if DEBUG
        print(value())
#endif
        return self
    }
    
    func debugExecute(_  function: () -> Void) -> some View {
#if DEBUG
        function()
#endif
        return self
    }
    
    func debugExecute(_ function: (Self) -> Void) -> some View {
#if DEBUG
        function(self)
#endif
        return self
    }
}

extension ShapeStyle where Self == Color {
    static var random: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

class AutorefreshingObject: ObservableObject {
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.objectWillChange.send()
        }
    }
}

struct PrintChange: View {
    @StateObject private var viewModel = AutorefreshingObject()
    
    var body: some View {
        //1. printchange
        let _ = Self._printChanges()
        Text("Example View Here")
            .background(.random)
        //2. debug
            .debugPrint {
                //print some message
            }
    }
}
