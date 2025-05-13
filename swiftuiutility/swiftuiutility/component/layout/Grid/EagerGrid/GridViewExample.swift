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
        Grid { //container with layout
            GridRow { //container without layout
                Text("Cell #1")
                    .padding(20)
                    .border(.red)
                
                Text("Cell #2")
                    .padding(20)
                    .border(.red)
            }
            
            GridRow { //container without layout
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


/* Refrain from making the grid grow for extra space -
 For example, for the horizontal dimension, the cell will only grow to take as much space as the widest cell in its column. Such cell will have no role in determining the column’s width. This is accomplished with the gridCellUnsizedAxes() modifier applied to the cell in question. It receives an Axis.Set value. It can be .horizontal, .vertical or a combination of both: [.horizontal, .vertical]. This tells the grid which dimension a given cell chooses to opt out of asking for additional space.
 */

/*
 In the following example the red cell is unsized in the horizontal axis, making it grow only as large as the green cell. Even if the parent is offering more, the red cell will not take it.
 */
struct GridViewExample2: View {
    var body: some View {
        Grid {
            GridRow {
                RoundedRectangle(cornerRadius: 5.0)
                    .fill(.green.gradient)
                    .frame(width: 160.0, height: 80.0)
                
                RoundedRectangle(cornerRadius: 5.0)
                    .fill(.blue.gradient)
                    .frame(width: 80.0, height: 80.0)
            }
            
            GridRow {
                RoundedRectangle(cornerRadius: 5.0)
                    .fill(.red.gradient)
                    .frame(height: 80.0)
                    .gridCellUnsizedAxes(.horizontal)
                
                RoundedRectangle(cornerRadius: 5.0)
                    .fill(.yellow.gradient)
                    .frame(width: 80.0, height: 80.0)
            }
        }
    }
}
