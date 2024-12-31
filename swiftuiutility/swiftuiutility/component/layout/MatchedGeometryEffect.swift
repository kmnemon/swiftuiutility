//
//  MatchedGeometryEffect.swift
//  swiftuiutility
//
//  Created by ke on 2024/12/31.
//

import SwiftUI

//Using Matched Geometry Effect
/*
 Both views — the button in the stack, and the stroked ellipse with the padding belong to the same geometry group because we speciﬁed the same namespace and a common identiﬁer.
 */

struct MatchedGeometryEffect: View {
    @Namespace var namespace
    let groupID = "highlight"
    
    var body: some View {
        VStack {
            Button("Sign Up") {}
            Button("Log In") {}
                .matchedGeometryEffect(id: groupID, in: namespace)
        }
        .border(Color.green)
        .overlay {
            Ellipse()
                .strokeBorder(Color.red, lineWidth: 1)
                .padding(-5)
                .matchedGeometryEffect(id: groupID, in: namespace, isSource: false)
        }
    }
}
