//
//  PropertiesView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/11.
//

import SwiftUI

struct PropertiesView: View {
    let motto1  = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    var motto3: some View{
        Text("some view")
    }
    
    var motto4: some View{
        VStack{
            Text("lumos")
            Text("Obliviate")
        }
    }
    
    var motto5: some View{
        Group{
            Text("aaaaa")
            Text("bbbb")
        }
    }
    
    @ViewBuilder var motto6: some View{
        Text("cccc")
        Text("dddd")
    }
    
    
    var body: some View {
        motto1
            .foregroundStyle(.red)
        motto2
            .foregroundStyle(.blue)
        
        motto3
        motto4
        motto5
        motto6
        
    }
}

#Preview {
    PropertiesView()
}
