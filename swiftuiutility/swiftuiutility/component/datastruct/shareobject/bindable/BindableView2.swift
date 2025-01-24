//
//  BindableView2.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI
// Bindable is used when you want to share observable classes between different Views

struct BindableView2: View {
    //1.using bindable to transfer obervable object
    @Bindable var order: NamespaceBindable.Order
    
    var body: some View {
        TextField("Order Name", text: $order.name)
        
        /*
         2.However, that isn't possible in some situations, such as when you've used @Environment already. For times like that, use @Bindable directly in your view body, like this
         */
        @Bindable var order = order
    }
}

#Preview {
    BindableView2(order: NamespaceBindable.Order())
}
