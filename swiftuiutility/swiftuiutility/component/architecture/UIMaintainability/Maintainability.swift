//
//  Maintainability.swift
//  SwiftArchitecture
//
//  Created by ke Liu on 3/21/26.
//

import SwiftUI

struct Maintainability: View {
    @State var oo = BooksOO()
    
    var body: some View {
        List {
            Section {
                ForEach(oo.data) { datum in
                    rowView(datum.name)
                        .listRowSeparator(.hidden)
                    
                    //3.using subviews
                    //BookRowView(bookName: datum.name)
                }
            } header: {
                sectionHeaderView
            }
        }
        .headerProminence(.increased)
        .listStyle(.plain)
        .onAppear {
            oo.fetch()
        }
    }
    
    //1. move into a property
    var sectionHeaderView: some View {
        HStack {
            Label("Books (\(oo.data.count))", systemImage: "books.vertical.fill")
            Spacer()
            Button("Add", systemImage: "plus") {
            }
            .buttonStyle(.bordered)
        }
    }
    
    //2.move into a function
    func rowView(_ bookName: String) -> some View {
        GroupBox {
            VStack {
                Image(systemName: "book.pages")
                Text(bookName)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}


