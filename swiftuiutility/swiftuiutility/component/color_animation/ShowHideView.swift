//
//  ShowHideView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/15.
//

import SwiftUI

struct ShowHideView: View {
    @State private var isShowingRed = false
    @State private var isShowingRed2 = false
    
    var body: some View {
        VStack{
            Button("Tap me 1"){
                withAnimation{
                    isShowingRed.toggle()
                }
            }
            if isShowingRed{
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.scale)
            }
            
            Button("Tap me 2"){
                withAnimation{
                    isShowingRed2.toggle()
                }
            }
            if isShowingRed2{
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    ShowHideView()
}
