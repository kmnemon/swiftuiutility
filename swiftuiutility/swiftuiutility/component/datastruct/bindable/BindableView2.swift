//
//  BindableView2.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI

struct BindableView2: View {
    @Bindable var order: Order
    
    var body: some View {
        TextField("Order Name", text: $order.name)
    }
}

#Preview {
    BindableView2(order: Order())
}
