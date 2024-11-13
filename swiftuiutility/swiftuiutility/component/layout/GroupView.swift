//
//  GroupView.swift
//  swiftuiutility
//
//  Created by ke on 4/10/24.
//

import SwiftUI

extension GroupView {
    struct UserView: View {
        var body: some View {
            Group {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .font(.title)
        }
    }
}

struct GroupView: View {
    @State private var layoutVertically = false
        
    var body: some View {
        //1.
        Button {
            layoutVertically.toggle()
        } label: {
            if layoutVertically {
                VStack {
                    UserView()
                }
            } else {
                HStack {
                    UserView()
                }
            }
        }
        
    }
}

#Preview {
    GroupView()
}
