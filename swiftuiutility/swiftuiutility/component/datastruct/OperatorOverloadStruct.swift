//
//  OperatorOverloadStruct.swift
//  swiftuiutility
//
//  Created by ke on 4/6/24.
//

import SwiftUI

extension BinaryInteger {
    static func *(lhs: Self, rhs: Double) -> Double {
        return Double(lhs) * rhs
    }
    
    static func *(lhs: Double, rhs: Self) -> Double {
        return lhs * Double(rhs)
    }
}

struct OperatorOverloadStruct: View {
    var body: some View {
        var a = 2 * 3.2
        Text("\(a)")
    }
}

#Preview {
    OperatorOverloadStruct()
}
