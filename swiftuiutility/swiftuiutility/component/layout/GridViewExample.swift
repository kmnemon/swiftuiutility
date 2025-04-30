//
//  GridViewExample.swift
//  swiftuiutility
//
//  Created by ke on 4/30/25.
//

import SwiftUI

//https://swiftui-lab.com/eager-grids/

//basic
struct GridViewExample1: View {
    var body: some View {
        Grid {
            GridRow {
                Text("Cell #1")
                    .padding(20)
                    .border(.red)
                
                Text("Cell #2")
                    .padding(20)
                    .border(.red)
            }
            
            GridRow {
                Text("Cell #3")
                Text("Cell #4")
            }
            .padding(20)
            .border(.green)
        }
        .padding(10)
        .border(.blue)
    }
}
