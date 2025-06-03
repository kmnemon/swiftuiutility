//
//  GridAlignment.swift
//  swiftuiutility
//
//  Created by ke on 5/13/25.
//

import SwiftUI
//https://swiftui-lab.com/eager-grids/

//1.Grid Alignment
/*
 When a view for a cell is smaller than the available space, the alignment will depend on several parameters. The first parameter to consider, is the Grid(alignment: Alignment). It affects all cells in the grid, unless overridden by one of the next parameters. If left unspecified, it defaults to .center.
 */
struct GridAlignment: View {
    var body: some View {
        Grid(alignment: .topLeading) {
            GridRow {
                Rectangle().fill(.yellow.gradient)
                    .frame(width: 50.0, height: 50.0)
                
                Rectangle().fill(.green.gradient)
                    .frame(width: 100.0, height: 100.0)

            }
            
            GridRow {
                Rectangle().fill(.orange.gradient)
                    .frame(width: 100.0, height: 100.0)

                Rectangle().fill(.red.gradient)
                    .frame(width: 50.0, height: 50.0)
            }
        }
    }
}


//2.Row Vertical Alignment
/*
 You may also specify a row alignment with GridRow(alignment: VerticalAlignment). Note that in this case, the alignment is only vertical. Cells in this row, will combine the Grid parameter, with the GridRow parameter. The row’s vertical alignment will have priority, over the grid’s vertical component of the alignment. In the example below, a grid with a .topTrailing value, combined with a .bottom vertical row value, results in a .bottomTrailing alignment for the cells in the second row. The other rows, will use the grids alignment (i.e., .topTrailing).
 */
struct RowVerticalAlignment: View {
    var body: some View {
        Grid(alignment: .topTrailing) {
            GridRow {
                Rectangle().fill(Color(white: 0.25).gradient)
                    .frame(width: 120.0, height: 100.0)

                Rectangle().fill(Color(white: 0.50).gradient)
                    .frame(width: 50.0, height: 50.0)

                Rectangle().fill(Color(white: 0.50).gradient)
                    .frame(width: 120.0, height: 100.0)
            }
            
            GridRow(alignment: .bottom) {
                Rectangle().fill(Color(white: 0.25).gradient)
                    .frame(width: 120.0, height: 100.0)

                Rectangle().fill(Color(white: 0.50).gradient)
                    .frame(width: 50.0, height: 50.0)

                Rectangle().fill(Color(white: 0.50).gradient)
                    .frame(width: 50.0, height: 50.0)
            }
            
            GridRow {
                Rectangle().fill(Color(white: 0.25).gradient)
                    .frame(width: 120.0, height: 100.0)

                Rectangle().fill(Color(white: 0.50).gradient)
                    .frame(width: 120.0, height: 100.0)

                Rectangle().fill(Color(white: 0.50).gradient)
                    .frame(width: 50.0, height: 50.0)
            }
        }
    }
}


//3.Column Horizontal Alignment
/*
 In addition to specifying a vertical row alignment, you may also specify a column horizontal alignment. As in the case of row alignments, this value will merge with the row vertical value and the grid’s alignment value. You indicate the column’s alignment with the modifier gridColumnAlignment()

 NOTE: The documentation is very clear. gridColumnAlignment should only be used in one cell per column. Otherwise the behavior is undefined.

 In the following example, you can see all alignments combined:

 Cell (1,1): Aligned topLeading. (Grid alignment)
 Cell (1, 2): Aligned topTrailing. (Grid alignment + column alignment)
 Cell (2,1): Aligned bottomLeading (Grid alignment + row alignment)
 Cell (2,2): Aligned bottomTrailing (Grid alignment + row alignment + column alignment)
 */
struct ColumnHorizontalAlignment: View {
    var body: some View {
            Grid(alignment: .topLeading, horizontalSpacing: 5.0, verticalSpacing: 5.0) {
                GridRow {
                    CellView(color: .green, width: 80, height: 80)

                    CellView(color: .yellow, width: 80, height: 80)
                        .gridColumnAlignment(.trailing)

                    CellView(color: .orange, width: 80, height: 120)
                }
                
                GridRow(alignment: .bottom) {
                    CellView(color: .green, width: 80, height: 80)

                    CellView(color: .yellow, width: 80, height: 80)

                    CellView(color: .orange, width: 80, height: 120)
                }
                
                GridRow {
                    CellView(color: .green, width: 120, height: 80)

                    CellView(color: .yellow, width: 120, height: 80)

                    CellView(color: .orange, width: 80, height: 80)
                }
            }
        }
        
        struct CellView: View {
            let color: Color
            let width: CGFloat
            let height: CGFloat
            
            var body: some View {
                RoundedRectangle(cornerRadius: 5.0)
                    .fill(color.gradient)
                    .frame(width: width, height: height)
            }
        }
}

//4.Cell Alignment
/*
 Finally, you may also specify an individual alignment for a cell using the .gridCellAnchor(_: anchor: UnitPoint) modifier. This alignment will override any grid, column and row alignment for the given cell. Note that the parameter type is not Alignment, but UnitPoint. This means that in addition to using the predefined points .topLeading, .center, etc, you may also create arbitrary points, like UnitPoint(x: 0.25, y: 0.75):
 */
struct CellAlignment: View {
    var body: some View {
        Grid(alignment: .topTrailing) {
            GridRow {
                Rectangle().fill(.green.gradient)
                    .frame(width: 120.0, height: 100.0)

                Rectangle().fill(.blue.gradient)
                    .frame(width: 50.0, height: 50.0)
                    .gridCellAnchor(UnitPoint(x: 0.25, y: 0.75))
            }
            
            GridRow {
                Rectangle().fill(.blue.gradient)
                    .frame(width: 50.0, height: 50.0)

                Rectangle().fill(.green.gradient)
                    .frame(width: 120.0, height: 100.0)

            }
        }
    }
}

//5.Text BaseLine Alignment
/*
 In addition to the common alignments, remember you may also use text baseline alignments. Both for Grid and GridRow
 */
struct TextBaseLineAlignment: View {
    var body: some View {
        Grid(alignment: .centerFirstTextBaseline) {
            GridRow {
                Text("Align")
                
                Rectangle()
                    .fill(.green.gradient.opacity(0.7))
                    .frame(width: 50, height: 50)
            }
        }
        .font(.system(size: 36))
    }
}
