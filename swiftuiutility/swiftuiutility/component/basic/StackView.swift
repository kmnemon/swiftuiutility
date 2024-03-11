//
//  StackView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/8.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        Section("1"){
            VStack(alignment: .leading) {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text("This is another text view")
                
                Spacer()
            }
        }
        
        Section("2") {
            HStack(spacing: 20) {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text("This is another text view")
            }
        }
        
        Section("3") {
            ZStack(alignment: .top) {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text("This is another text view")
            }
        }
        
        Section("4"){
            VStack{
                
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
        }
    }
}

#Preview {
    StackView()
}
