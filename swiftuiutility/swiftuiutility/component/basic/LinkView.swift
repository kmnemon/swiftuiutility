//
//  Link.swift
//  swiftuiutility
//
//  Created by ke Liu on 2/27/26.
//

import SwiftUI

struct LinkView: View {
    let url = URL(string: "https://example.com/sample-book")!
    
    var body: some View {
            Link("Learn More", destination: url)

    }
}
