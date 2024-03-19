//
//  NavigationStackReturnView.swift
//  swiftuiutility
//
//  Created by ke on 3/19/24.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    
    //use to return home
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar{
                Button("Home"){
                    path = NavigationPath()
                }
            }
    }
}

struct NavigationStackReturnView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self){ i in
                        DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    NavigationStackReturnView()
}
