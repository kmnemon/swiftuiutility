//
//  IdentityExample.swift
//  swiftuiutility
//
//  Created by ke on 2025/3/12.
//

import SwiftUI

struct ExampleView: View {
    @State private var counter = 0
    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
    }
}



//example 1: two different view
struct IdentityExample1: View {
    @State private var scaleUp = false
    
    var body: some View {
        VStack {
            if scaleUp {
                ExampleView()
                    .scaleEffect(2)
            } else {
                ExampleView()
            }
            
            Toggle("Scale Up", isOn: $scaleUp.animation())
        }
        .padding()
    }
}

struct IdentityExample2: View {
    @State private var scaleUp = false
    
    var body: some View {
        VStack {
            if scaleUp {
                ExampleView()
            } else {
                ExampleView()
            }
            
            Toggle("Scale Up", isOn: $scaleUp.animation())
        }
        .padding()
    }
}

struct IdentityExample3: View {
    @State private var scaleUp = false
    
    var body: some View {
        VStack {
            if scaleUp {
                ExampleView()
                    .id("Example")
            } else {
                ExampleView()
                    .id("Example")
            }
            
            Toggle("Scale Up", isOn: $scaleUp.animation())
        }
        .padding()
    }
}

//example 2: SwiftUI think it is a single view, do not destory it
struct ExampleView2: View {
    @State private var counter = 0
    let scale: Double
    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
        .scaleEffect(scale)
    }
}

struct IdentityExample4: View {
    @State private var scaleUp = false
    
    var exampleView: some View {
        if scaleUp {
            return ExampleView2(scale: 2)
                .id("Example")
        } else {
            return ExampleView2(scale: 1)
                .id("Example")
        }
    }
    
    var body: some View {
        VStack {
            exampleView
            
            Toggle("Scale Up", isOn: $scaleUp.animation())
        }
        .padding()
    }
}

//even if we delete the explicit identity, SwiftUI think it is single view too.
struct IdentityExample5: View {
    @State private var scaleUp = false
    
    var exampleView: some View {
        if scaleUp {
            return ExampleView2(scale: 2)
        } else {
            return ExampleView2(scale: 1)
        }
    }
    
    var body: some View {
        VStack {
            exampleView
            
            Toggle("Scale Up", isOn: $scaleUp.animation())
        }
        .padding()
    }
}

// what we really want is using ternary conditional operator
struct IdentityExample6: View {
    @State private var scaleUp = false
    
    var body: some View {
        VStack {
            ExampleView2(scale: scaleUp ? 2 : 1)
            
            Toggle("Scale Up", isOn: $scaleUp.animation())
        }
        .padding()
    }
}

//example 3:
struct IdentityExample7: View {
    @State private var isNewMessage = false
    
    var body: some View {
        VStack {
            //.bold() using isActive parameter, support target iOS16 or above
            Text("Message title here")
                .bold(isNewMessage)
            
            //want to support iOS 15 or below
            Text("Message title here")
                .fontWeight(isNewMessage ? .bold : .regular)
            
            Text("Message title here")
                .fontWeight(isNewMessage ? .bold : nil)
        }
        .padding()
    }
}

//example 4: hiden
/*
 extension View {
     func hidden(_ hidden: Bool) -> some View {
         self.opacity(hidden ? 0 : 1)
     }
 }

 struct IdentityExample8: View {
     @State private var shouldHide = false
     var body: some View {
         VStack {
             ExampleView(scale: 1)
                 .hidden(shouldHide)
             
             
             Button("Toggle") {
                 withAnimation {
                     shouldHide.toggle()
                 }
             }
         }
     }
     
 }
 */

