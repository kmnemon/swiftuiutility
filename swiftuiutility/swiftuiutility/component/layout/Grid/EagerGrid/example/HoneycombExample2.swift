//
//  HoneycombExample2.swift
//  swiftuiutility
//
//  Created by ke on 5/13/25.
//

import SwiftUI

struct Person {
    let name: String
    let image: String
    var color: Color = .accentColor
    var flipped: Bool = false
}

@Observable
class DataModel {
    static let people: [Person] = [
        Person(name: "Peter", image: "tony-1"),
        Person(name: "Carlos", image: "tony-2"),
        Person(name: "Jennifer", image: "tony-3"),
        Person(name: "Paul", image: "tony-4"),
        Person(name: "Charlotte", image: "tony-5"),
        Person(name: "Thomas", image: "tony-6"),
        Person(name: "Sophia", image: "tony-7"),
        Person(name: "Isabella", image: "tony-1"),
        Person(name: "Ivan", image: "tony-2"),
        Person(name: "Laura", image: "tony-3"),
        Person(name: "Scott", image: "tony-4"),
        Person(name: "Henry", image: "tony-5"),
        Person(name: "Laura", image: "tony-6"),
        Person(name: "Abigail", image: "tony-7"),
        Person(name: "James", image: "tony-1"),
        Person(name: "Amelia", image: "tony-2"),
    ]
    
    static let colors: [Color] = [.yellow, .orange, .red, .purple, .blue, .pink, .green, .indigo]
    
    var rows: [[Person]] = DataModel.buildDemoCells()
    
    var columns: Int { rows.first?.count ?? 0 }
    var colCount: CGFloat { CGFloat(columns) }
    var rowCount: CGFloat { CGFloat(rows.count) }
    
    static func buildDemoCells() -> [[Person]] {
        var array = [[Person]]()
        
        // Add 15 rows
        for r in 0..<15 {
            var a = [Person]()
            
            // Add 6 cells per row
            for c in 0..<6 {
                let idx = (r*6 + c)
                var person = people[idx % people.count]
                person.color = colors[idx % colors.count]
                a.append(person)
            }
            
            array.append(a)
        }
        
        return array
    }
}

struct ContentView: View {
    @State private var model = DataModel()
    @State private var spacing: CGFloat = 8 // step #7: same spacing for vertical and horizontal inter cell spacing
    
    // Constants
    private let cellWidth: CGFloat = 100
    
    var body: some View {
        let offset: CGFloat = (cellWidth / 2.0 + spacing / 2.0) / 2.0
        let cellHeight: CGFloat = cellWidth / cos(.pi / 6) * (3/4) // steps #2 and #5
        
        let gridSize = CGSize(width: model.colCount * cellWidth - (cellWidth / 2) + (spacing * (model.colCount - 1)),
                              height: model.rowCount * cellHeight - (cellHeight / 4) + (spacing * (model.rowCount - 1)))
        
        VStack {
            ScrollView { // step #6: the scrollview clips the grid
                Grid(alignment: .center, horizontalSpacing: spacing, verticalSpacing: spacing) {
                    ForEach(model.rows.indices, id: \.self) { rowIdx in
                        GridRow {
                            ForEach(model.rows[rowIdx].indices, id: \.self) { personIdx in
                                
                                let person = model.rows[rowIdx][personIdx]
                                
                                HoneyCombView(person: person, width: cellWidth, flip: person.flipped ? 1.0 : 0.0)
                                    .frame(width: cellWidth, height: cellHeight)
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.5)) {
                                            model.rows[rowIdx][personIdx].flipped.toggle()
                                        }
                                    }
                            }
                        }
                        // "even" rows shifted to left, "odd" rows to the right
                        .offset(x: ((rowIdx % 2 == 0) ? -1 : 1) * offset) // step #4
                    }
                }
                .frame(width: gridSize.width, height: gridSize.height)
                .background(.gray.gradient)
            }
            .frame(height: 400)
            
            Spacer().frame(height: 30)
            
            Slider(value: $spacing, in: 0...50).frame(width: 300)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct HoneyCombView: View, Animatable {
    // View parameters
    var person: Person
    let width: CGFloat // we only provide the width, the view will calculate appropriate height
    var flip: Double // 0.0: shows full image, 0.5: flip is mid-way, 1.0: shows person name with color background
    
    // Animatable
    var animatableData: Double {
        get { return flip }
        set { flip = newValue }
    }
    
    // On a hexagon, the height is slightly larger than the width
    var height: CGFloat { width / cos(.pi / 6) }
    
    var scaleValue: CGFloat {
        return flip < 0.5 ? (1 - flip * 2) : ((flip - 0.5) * 2)
    }
    
    var body: some View {
        Group {
            if flip < 0.5 {
                // From flip 0 to 0.5, show the image
                Image(person.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                // From flip 0.5 to 1.0, show the color and name
                Rectangle()
                    .overlay {
                        Text(person.name)
                            .foregroundColor(.white)
                            .font(.custom("Optima", size: 14.0))
                            .bold()
                    }
            }
        }
        .frame(width: width, height: height)
        .clipShape(HexagonShape()) // step #3
        .contentShape(HexagonShape())
        .overlay {
            HexagonShape().stroke(.white, lineWidth: 2.0)
        }
        .shadow(radius: 3)
        .scaleEffect(x: scaleValue)
        .foregroundStyle(person.color.gradient)
    }
    
    struct HexagonShape: Shape {
        func path(in rect: CGRect) -> Path {
            Path { path in
                
                let height = rect.height
                let width = rect.height * cos(.pi/6)
                
                let h = height / 4
                let w = width / 2
                
                let pt1 = CGPoint(x: rect.midX, y: rect.minY)
                let pt2 = CGPoint(x: rect.midX + w, y: h + rect.minY)
                let pt3 = CGPoint(x: rect.midX + w, y: h * 3 + rect.minY)
                let pt4 = CGPoint(x: rect.midX, y: rect.maxY)
                let pt5 = CGPoint(x: rect.midX - w, y: h * 3 + rect.minY)
                let pt6 = CGPoint(x: rect.midX - w, y: h + rect.minY)
                
                path.addLines([pt1, pt2, pt3, pt4, pt5, pt6])
                
                path.closeSubpath()
            }
        }
    }
}

#Preview {
    ContentView()
}
