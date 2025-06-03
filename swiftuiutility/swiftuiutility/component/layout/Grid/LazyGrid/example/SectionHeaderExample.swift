//
//  SectionHeaderExample.swift
//  swiftuiutility
//
//  Created by ke on 5/11/25.
//

import SwiftUI

struct SectionHeaderExample: View {
    @State private var gridWidth: CGFloat = 800
    @State private var info: GridInfo = GridInfo()
    
    var body: some View {
        let gridItems = [GridItem(.adaptive(minimum: 100, maximum: .infinity), spacing: 10)]
        
        VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: gridItems, spacing: 10, pinnedViews: .sectionHeaders) {
                    Section(header: HeaderView(info: self.info)) {
                        ForEach(0..<200) { idx in
                            Image("tony-1")
                                .resizable()
                                .frame(height: info.cellWidth(idx))
                                .gridInfoId(idx)
                        }
                    }
                }
                .frame(width: gridWidth)
                .gridInfo($info)
            }
            
            Slider(value: $gridWidth, in: 0...1500)
        }
    }
    
}


struct HeaderView: View {
    let info: GridInfo
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<info.columnCount) { colIdx in
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.7))
                    .frame(width: info.columnWidth(colIdx))
                    .overlay(Text("Column \(colIdx + 1)"))
                    .padding(.trailing, info.spacing(colIdx))
            }
            // Force ForEach to redraw when columnCount changes.
            // Not best solution, but good enough for this example.
            .id(info.columnCount)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .frame(height: 40)
    }
}

struct GridInfoPreference {
    let id: Int
    let bounds: Anchor<CGRect>
}

struct GridPreferenceKey: PreferenceKey {
    static var defaultValue: [GridInfoPreference] = []
    
    static func reduce(value: inout [GridInfoPreference], nextValue: () -> [GridInfoPreference]) {
        return value.append(contentsOf: nextValue())
    }
}

extension View {
    func gridInfoId(_ id: Int) -> some View {
        self.anchorPreference(key: GridPreferenceKey.self, value: .bounds) {
                [GridInfoPreference(id: id, bounds: $0)]
            }
    }
    
    func gridInfo(_ info: Binding<GridInfo>) -> some View {
        self.backgroundPreferenceValue(GridPreferenceKey.self) { prefs in
            GeometryReader { proxy -> Color in
                DispatchQueue.main.async {
                    info.wrappedValue.cells = prefs.compactMap {
                      GridInfo.Item(id: $0.id, bounds: proxy[$0.bounds])
                    }
                }
                    
                return Color.clear
            }
        }
    }
}

struct GridInfo: Equatable {
    // A array of all rendered cells's bounds
    var cells: [Item] = []
    
    // a computed property that returns the number of columns
    var columnCount: Int {
        guard cells.count > 1 else { return cells.count }

        var k = 1

        for i in 1..<cells.count {
            if cells[i].bounds.origin.x > cells[i-1].bounds.origin.x {
                k += 1
            } else {
                break
            }
        }

        return k
    }
    
    // a computed property that returns the range of cells being rendered
    var cellRange: ClosedRange<Int>? {
        guard let lower = cells.first?.id, let upper = cells.last?.id else { return nil }
        
        return lower...upper
    }
  
    // returns the width of a rendered cell
    func cellWidth(_ id: Int) -> CGFloat {
        columnCount > 0 ? columnWidth(id % columnCount) : 0
    }
    
    // returns the width of a column
    func columnWidth(_ col: Int) -> CGFloat {
        columnCount > 0 && col < columnCount ? cells[col].bounds.width : 0
    }
    
    // returns the spacing between columns col and col+1
    func spacing(_ col: Int) -> CGFloat {
        guard columnCount > 0 else { return 0 }
        let left = col < columnCount ? cells[col].bounds.maxX : 0
        let right = col+1 < columnCount ? cells[col+1].bounds.minX : left
        
        return right - left
    }

    // Do not forget the "Equatable", as it prevent redrawing loops
    struct Item: Equatable {
        let id: Int
        let bounds: CGRect
    }
}
