//
//  ContentView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack{
                List{
                    NavigationLink("Form"){
                        FormView()
                    }
                    NavigationLink("List"){
                        ListView()
                    }
                    NavigationLink("Image"){
                        ImageView()
                    }
                    NavigationLink("ScrollView"){
                        ScrollViewC()
                    }
                    NavigationLink("NavagationStack"){
                        NavigationStackView()
                    }
                    NavigationLink("NavagationLink"){
                        NavigationLinkView()
                    }
                    NavigationLink("JSON"){
                        JsonView()
                    }
                    NavigationLink("ScrollingGridView"){
                        ScrollingGridView()
                    }
                    
                }
                .navigationTitle("Choose Component")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
