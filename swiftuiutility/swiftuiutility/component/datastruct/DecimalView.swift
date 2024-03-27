//
//  DecimalView.swift
//  swiftuiutility
//
//  Created by ke on 3/27/24.
//

import SwiftUI

struct DecimalView: View {
    var d: Decimal = 10.1
    
    var body: some View {
        Text("Decimal value is \(d, format: .currency(code: "USD"))")
    }
}

#Preview {
    DecimalView()
}
