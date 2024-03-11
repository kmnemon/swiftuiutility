//
//  CustomContainersView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/11.
//

import SwiftUI

struct GridStack<Content: View>: View{
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View{
        VStack{
            ForEach(0..<rows, id: \.self){ row in
                HStack{
                    ForEach(0..<columns, id: \.self){ column in
                            content(row, column)
                    }
                }
            }
        }
    }
}

struct CustomContainersView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4){row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
            
        }
    }
}

#Preview {
    CustomContainersView()
}
