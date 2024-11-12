//
//  GroupView.swift
//  swiftuiutility
//
//  Created by ke on 4/10/24.
//

import SwiftUI

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

struct GroupView: View {
    @State private var layoutVertically = false
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
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
        
        //2. compact or regular
        if horizontalSizeClass == .compact {
            VStack(content: UserView.init)
        } else {
            HStack(content: UserView.init)
        }
        
    }
}

#Preview {
    GroupView()
}
