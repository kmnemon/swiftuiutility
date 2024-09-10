//
//  ImageView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        ScrollView{
            VStack{
                Section("1"){
                    Image("zelda-botw-logo_2x")
                        .frame(width: 300, height: 300)
                        .clipped()
                    //            Image(.zelda-botw-logo_2x)
                }
                
                Section("2"){
                    Image("zelda-botw-logo_2x")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
                
                
                Section("3"){
                    Image("zelda-botw-logo_2x")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                }
                
                
                Section("4"){
                    Image("zelda-botw-logo_2x")
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal){ size, axis in
                            size * 0.8
                        }
                }
                
                Section("voice over do not read") {
                    Image(decorative: "ze lda-botw-logo_2x")
                }
                
                Section("SSF") {
                    Image(systemName: "pencil.circle")
                        .foregroundStyle(.red)
                        .font(.largeTitle)
                }
                
                Section("5"){
                    Image("zelda-botw-logo_2x")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                        .clipShape(.capsule)
                        .shadow(radius: 5)
                }
            }
        }
    }
}

#Preview {
    ImageView()
}
