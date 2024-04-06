//
//  BindableView2.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI

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
