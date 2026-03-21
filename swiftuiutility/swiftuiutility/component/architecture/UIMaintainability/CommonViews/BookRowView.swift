//
//  BookRowView.swift
//  SwiftArchitecture
//
//  Created by ke Liu on 3/21/26.
//

import SwiftUI

//3. subview
struct BookRowView: View {
    let bookName: String
    
    var body: some View {
        GroupBox {
            VStack {
                Image(systemName: "book.pages")
                Text(bookName)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .listRowSeparator(.hidden)
    }
}

