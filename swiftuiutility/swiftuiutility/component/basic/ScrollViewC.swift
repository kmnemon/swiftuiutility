//
//  ScrollView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI

struct CustomTextInScrollViewC: View {
    let text: String
    
    var body: some View{
        Text(text)
    }
    
    init(text: String){
        print("creating a new CustomText")
        self.text = text
    }
}


struct ScrollViewC: View {
    var body: some View {
        Section("1"){
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(0..<20) {
                        Text("Item \($0)")
                            .font(.title)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        
        /*
         Layout Difference:
         lazy stacks always take up as much as room as is available in our layouts, whereas regular stacks take up only as much space as is needed. This is intentional, because it stops lazy stacks having to adjust their size if a new view is loaded that wants more space.
        */
        Section("2"){
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(0..<20) {
                        CustomTextInScrollViewC(text: "Item \($0)")
                            .font(.title)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        
        Section("3"){
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(0..<20) {
                        CustomTextInScrollViewC(text: "Item \($0)")
                            .font(.title)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
    
}

#Preview {
    ScrollViewC()
}
