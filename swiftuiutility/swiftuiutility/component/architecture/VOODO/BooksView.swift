//
//  BooksView.swift
//  SwiftArchitecture
//
//  Created by ke on 3/21/26.
//

import SwiftUI

//1. View
struct BooksView: View {
    @State private var oo = BooksOO()
    
    var body: some View {
        List(oo.data) { datum in
            Text(datum.name)
        }
        .font(.title)
        .onAppear {
            oo.fetch()
        }
    }
}
