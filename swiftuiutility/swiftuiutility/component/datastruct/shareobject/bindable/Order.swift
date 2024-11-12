//
//  Order.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import Foundation

struct NamespaceBindable {}

extension NamespaceBindable {
    
    @Observable
    class Order {
        var type = ""
        var quantity = 3
        var name = ""
        
        var hasValidOrder: Bool {
            if name.isEmpty || type.isEmpty {
                return false
            }
            
            return true
        }
    }
}
