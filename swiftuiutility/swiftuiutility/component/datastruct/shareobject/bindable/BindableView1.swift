//
//  BindableView1.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI

struct BindableView1: View {
    @State private var order = NamespaceBindable.Order()
    
    var body: some View {
        NavigationStack {
            NavigationLink("Bindable"){
                BindableView2(order: order)
            }
        }
    }
}

#Preview {
    BindableView1()
}
