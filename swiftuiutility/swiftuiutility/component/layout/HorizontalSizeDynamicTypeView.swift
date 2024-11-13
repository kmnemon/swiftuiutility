//
//  GroupView.swift
//  swiftuiutility
//
//  Created by ke on 4/10/24.
//

import SwiftUI

extension HorizontalSizeClassDynamicTypeSizeView {
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

struct HorizontalSizeClassDynamicTypeSizeView: View {    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        //2. compact or regular
        if horizontalSizeClass == .compact {
            VStack(content: UserView.init)
        } else {
            HStack(content: UserView.init)
        }
        
        //3.DynamicTypeSize
        Group {
            if horizontalSizeClass == .compact && dynamicTypeSize > .large {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
        }
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge) // limit not beyond xxxLard type size
        
    }
}

#Preview {
    GroupView()
}
