//
//  ScrollingGridView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI

struct GridItemAndLazyVGridView: View {
    let layout1 = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    
    let layout2 = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    
    var body: some View {
        Section("1") {
            ScrollView {
                LazyVGrid(columns: layout1) {
                    ForEach(0..<1000){
                        Text("Item \($0)")
                    }
                }
            }
        }
        
        Section("2") {
            ScrollView {
                LazyVGrid(columns: layout2) {
                    ForEach(0..<1000){
                        Text("Item \($0)")
                    }
                }
            }
        }
        
        Section("3") {
            ScrollView(.horizontal) {
                LazyHGrid(rows: layout1) {
                    ForEach(0..<1000){
                        Text("Item \($0)")
                    }
                }
            }
        }
    }
}

#Preview {
    GridItemAndLazyVGridView()
}
