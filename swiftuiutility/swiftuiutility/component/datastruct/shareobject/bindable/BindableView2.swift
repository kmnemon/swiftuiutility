//
//  BindableView2.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI
// Bindable is used when you want to share observable classes between different Views

struct BindableView2: View {
    //using bindable to transfer obervable object
    @Bindable var order: NamespaceBindable.Order
    
    var body: some View {
        TextField("Order Name", text: $order.name)
    }
}

#Preview {
    BindableView2(order: NamespaceBindable.Order())
}
