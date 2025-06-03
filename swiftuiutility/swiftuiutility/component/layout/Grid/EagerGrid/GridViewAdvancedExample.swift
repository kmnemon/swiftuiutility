//
//  GridViewAdvancedExample.swift
//  swiftuiutility
//
//  Created by ke on 5/13/25.
//

import SwiftUI

/*
 1. Rows without GridRow
 
 If a Grid has a view outside of a GridRow container, it is used as a single cell row that spans all columns. A common use for this type of cell, is to create separators. For example, you could use a Divider() view, or something more complex as in the example below. Note that we usually do not want the divider to make the grid grow to its maximum, so we make the view unsized on the horizontal axis. This will make the divider as wide as the widest row, but not wider.
 */

struct RowsWithoutGridRow: View {
    var body: some View {
        Grid(horizontalSpacing: 5.0, verticalSpacing: 5.0) {
            GridRow {
                RoundedRectangle(cornerRadius: 5.0).fill(.green.gradient)
                
                RoundedRectangle(cornerRadius: 5.0).fill(.purple.gradient)
                
                RoundedRectangle(cornerRadius: 5.0).fill(.blue.gradient)
            }
            .frame(width: 50.0, height: 50.0)
            
            Rectangle()
                .fill(LinearGradient(colors: [.gray, .clear, .gray], startPoint: .leading, endPoint: .trailing))
                .frame(height: 2.0)
                .gridCellUnsizedAxes(.horizontal)
            
            
            GridRow {
                RoundedRectangle(cornerRadius: 5.0).fill(.green.gradient)
                
                RoundedRectangle(cornerRadius: 5.0).fill(.purple.gradient)
                
                RoundedRectangle(cornerRadius: 5.0).fill(.blue.gradient)
            }
            .frame(width: 50.0, height: 50.0)
        }
    }
}

/*
 2. Column Spanning
 
 One of the advantages of eager grids over lazy grids, is that all cell geometries are always known. This makes it possible to have a cell that spans multiple columns. To configure a cell to span, use the .gridCellColumns(_ count: Int)
 */
struct ColumnSpanning: View {
    var body: some View {
        Grid {
            GridRow {
                RoundedRectangle(cornerRadius: 5.0).fill(.green.gradient)
                    .frame(width: 50.0, height: 50.0)
                
                RoundedRectangle(cornerRadius: 5.0).fill(.yellow.gradient)
                    .frame(height: 50.0)
                    .gridCellColumns(3)
                    .gridCellUnsizedAxes(.horizontal)
                
                RoundedRectangle(cornerRadius: 5.0).fill(.purple.gradient)
                    .frame(width: 50.0, height: 50.0)
            }
            
            GridRow {
                RoundedRectangle(cornerRadius: 5.0).fill(.green.gradient)
                    .frame(width: 50.0, height: 50.0)
                
                RoundedRectangle(cornerRadius: 5.0).fill(.yellow.gradient)
                    .frame(width: 50.0, height: 50.0)
                
                RoundedRectangle(cornerRadius: 5.0).fill(.orange.gradient)
                    .frame(width: 50.0, height: 50.0)
                
                RoundedRectangle(cornerRadius: 5.0).fill(.red.gradient)
                    .frame(width: 50.0, height: 50.0)
                
                RoundedRectangle(cornerRadius: 5.0).fill(.purple.gradient)
                    .frame(width: 50.0, height: 50.0)
            }
        }
    }
}

/*
 3. Watch Out for Ambiguity
 
 Consider the following example. We have 4 cells per row. Each cell is 50.0 pt wide, except for the second cell from the first row, and the third cell in the second row. These will grow as much as possible (without enlarging the grid). These two cells also span two columns each.
 What do you think should happen? If you look at it carefully, this is “the chicken or the egg problem”. If you look at the second cell in the first row, it should span to the following column. But the following column in the second row should expand to the third column. So what is it? We can satisfy one condition, or the other, but not both. This is because the first row looks at the second row to determine the next column, while the second row looks at the first to do the same. SwiftUI needs to resolve this somehow, and if you run the code, this is the result you will get:
 
 To break the tie, an easy solution is to add a third row:
 */
struct WatchOutForAmbiguity: View {
    var body: some View {
        Grid(horizontalSpacing: 20.0, verticalSpacing: 20.0) {
            GridRow {
                CellView(width: 50.0, color: .green)
                
                CellView(color: .purple)
                    .gridCellColumns(2)
                
                CellView(width: 50.0, color: .blue)
                
                CellView(width: 50.0, color: .yellow)
            }
            .gridCellUnsizedAxes([.horizontal, .vertical])
            
            GridRow {
                CellView(width: 50.0, color: .green)
                
                CellView(width: 50.0, color: .purple)
                
                CellView(color: .blue)
                    .gridCellColumns(2)
                
                CellView(width: 50.0, color: .yellow)
            }
            .gridCellUnsizedAxes([.horizontal, .vertical])
            
            //To break the tie, an easy solution is to add a third row:
            GridRow {
                CellView(width: 50, color: .green)
                
                CellView(width: 50, color: .purple)
                
                CellView(width: 50, color: .blue)
                
                CellView(width: 50, color: .yellow)
            }
        }
    }
    
    struct CellView: View {
        var width: CGFloat? = nil
        let color: Color
        
        var body: some View {
            RoundedRectangle(cornerRadius: 5.0)
                .fill(color.gradient)
                .frame(width: width, height: 50.0)
        }
    }
}
