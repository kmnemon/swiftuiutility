//
//  RunOnce.swift
//  swiftuiutility
//
//  Created by ke Liu on 4/11/25.
//

import SwiftUI

struct OnFirstAppearModifier: ViewModifier {
    @State private var hasLoaded = false
    var perform: () -> Void
    
    func body(content: Content) -> some View {
        content.onAppear {
            guard hasLoaded == false else { return }
            hasLoaded = true
            perform()
        }
    }
}
extension View {
    func onFirstAppear(perform: @escaping () -> Void) -> some View {
        modifier(OnFirstAppearModifier(perform: perform))
    }
}

extension RunOnce {
    struct ExampleView: View {
        let number: Int
        
        var body: some View {
            Text("View \(number)")
                .onFirstAppear {
                    print("View \(number) appeared")
                }
        }
    }
}

struct RunOnce: View {
    var body: some View {
        TabView {
            ForEach(1..<6) { i in
                ExampleView(number: i)
                    .tabItem { Label(String(i), systemImage: "\(i).circle") }
            }
        }
    }
}
