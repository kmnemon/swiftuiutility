//
//  ForEachView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/11.
//

import SwiftUI

struct ForEachView: View {
    let agents = ["cyril", "lana", "pam", "sterling"]
    
    var body: some View {
        VStack{
            HStack{
                ForEach(0..<5){ number in
                    Text("Row \(number)")
                }
            }
            
            HStack{
                ForEach(0..<agents.count){
                    Text(agents[$0])
                }
            }
            
            HStack{
                ForEach(agents, id:\.self){
                    Text($0)
                }
            }
        }
    }
}

#Preview {
    ForEachView()
}
