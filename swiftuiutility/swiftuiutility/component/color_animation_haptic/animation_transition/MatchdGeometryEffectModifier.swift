//
//  MatchdGeometryEffectModifier.swift
//  swiftuiutility
//
//  Created by ke on 4/1/26.
//

import SwiftUI

struct MatchdGeometryEffectModifier: View {
    @State private var tabs: [String] = ["Custom", "Artists", "Albums", "Songs", "Genres"]
    @State private var selectedTab: String = ""
    @Namespace private var tabNamespace
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                VStack {
                    Text(tab)
                        .foregroundColor(selectedTab == tab ? .blue : .gray)
                        .padding(.horizontal)
                        .animation(.default, value: selectedTab)
                    
                    ZStack {
                        if selectedTab == tab {
                            Rectangle()
                                .fill(Color.blue)
                                .matchedGeometryEffect(id: "tabUnderline", in: tabNamespace)
                                .frame(height: 2)
                        } else {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: 2)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                        selectedTab = tab
                    }
                    
                }
            }
        }
        .padding(.horizontal)
    }
}
