//
//  AnimationAndTransaction.swift
//  swiftuiutility
//
//  Created by ke on 12/26/24.
//

import SwiftUI

struct AnimationAndTransaction: View {
    @State private var flag: Bool = false
    
    var body: some View {
        //1. explicit animation
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .onTapGesture {
                withAnimation(.linear) { flag.toggle() }
            }
        
        // explicit transaction implementation
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .onTapGesture {
                var t = Transaction(animation: .default)
                withTransaction(t) { flag.toggle() }
            }
        
        //2. implicit animation
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .animation(.default, value: flag)
            .onTapGesture {
                flag.toggle()
            }
        
        // implicit transaction implementation
        // this code behaves like the deprecated .animation(_:) API without the value parameter
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .transaction { t in
                t.animation = .default
            }
            .onTapGesture { flag.toggle() }
        
        
        //3. completion handlers
        //3.1 explicit
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .onTapGesture {
                print("done") //completion handlers
                withAnimation(.default) { flag.toggle() }
            }
        
        //3.2 implicit run only once
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .animation(.default, value: flag)
            .transaction {
                $0.addAnimationCompletion { print("Done!") }
            }
            .onTapGesture {
                flag.toggle()
            }
        
        //3.3 implicit run every time the animation is end
        Rectangle()
            .frame(width: flag ? 100 : 50, height: 50)
            .animation(.default, value: flag)
            .transaction(value: flag) {
                $0.addAnimationCompletion { print("Done!") }
            }
            .onTapGesture {
                flag.toggle()
            }
    }
}
