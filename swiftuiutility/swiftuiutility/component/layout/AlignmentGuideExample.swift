//
//  AlignmentGuideExample.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/26.
//
import SwiftUI

struct AlignmentGuideExample: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            row(title: "Row 1", showIcon: false)
            row(title: "Row 2", showIcon: true)
            row(title: "Row 3", showIcon: false)
            
//            rowWithAlignmentGuide(title: "Row 1", showIcon: false)
//            rowWithAlignmentGuide(title: "Row 2", showIcon: true)
//            rowWithAlignmentGuide(title: "Row 3", showIcon: false)
        }
        .padding(16)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(40)
    }
    
    //option 1:
    private func row(title: String, showIcon: Bool) -> some View {
        HStack(spacing: 10) {
            Image(systemName: "info.circle")
                .frame(width: 30, height: 30)
                .opacity(showIcon ? 1 : 0)
            
            Text(title)
            
            Spacer()
        }
    }
    
    //option 2:
    private func rowWithAlignmentGuide(title: String, showIcon: Bool) -> some View {
        HStack(spacing: 10) {
            if showIcon {
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 30)
            }
            
            Text(title)
            
            Spacer()
        }
        .alignmentGuide(.leading) { dimensions in
            return showIcon ? 40 : 0
        }
    }
}
