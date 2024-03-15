//
//  OtherView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/10.
//

import SwiftUI

struct RandomStruct: View {
    //random
    var r = Int.random(in: 0...2)
    
    //shuffled
    @State private var shuffledArray = [1, 2, 3, 4, 5, 6].shuffled()
    
    var body: some View {
        Button{
            shuffledArray.shuffle()
        } label: {
            Text("Tap me to see shuffled array")
            Text("\(shuffledArray[0])")
        }
        
        //print type
        Button("a"){
            print(type(of: self.body))
        }
        .frame(width:200, height: 200)
        .background(.red)
    }
}

#Preview {
    RandomStruct()
}
