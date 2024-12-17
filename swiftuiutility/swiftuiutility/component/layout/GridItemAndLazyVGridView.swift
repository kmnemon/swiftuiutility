//
//  ScrollingGridView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI
/*
 There are three column types: fixed columns, flexible columns, and adaptive columns.
 1.Fixed-width columns unconditionally become their specified width,
 2.Flexible columns are flexible (but have lower and upper bounds on their width),
 3.Adaptive columns are really containers that host multiple subcolumns.
 */

struct GridItemAndLazyVGridView: View {
    let layout1 = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]
    
    let layout2 = [
        GridItem(.flexible(minimum: 60)),
        GridItem(.flexible(minimum: 120))
    ]
    
    let layout3 = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    
    var body: some View {
        Section("Fixed-width columns") {
            ScrollView {
                LazyVGrid(columns: layout1) {
                    ForEach(0..<1000){
                        Text("Item \($0)")
                    }
                }
            }
        }
        
        Section("Flexible columns") {
            ScrollView {
                LazyVGrid(columns:layout1, spacing: 10) {
                    ForEach(0..<1000){
                        Text("Item \($0)")
                    }
                }
                .frame(width: 200)
                .border(.teal)
            }
        }
        
        Section("Adaptive columns") {
            ScrollView {
                LazyVGrid(columns: layout3) {
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
