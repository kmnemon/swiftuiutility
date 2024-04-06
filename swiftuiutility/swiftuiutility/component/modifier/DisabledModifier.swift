//
//  DisabledModifier.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI


struct DisabledModifier: View {
    @State private var order = NamespaceBindable.Order()
    
    var body: some View {
        Section {
            Form {
                TextField("Name", text: $order.name)
                TextField("Type", text: $order.type)
            }
        }
        
        Section {
            Button("send"){

            }
        }
        .disabled(order.hasValidOrder == false)
    }
}

#Preview {
    DisabledModifier()
}
