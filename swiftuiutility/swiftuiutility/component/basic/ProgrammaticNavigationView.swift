//
//  ProgrammaticNavigationView.swift
//  swiftuiutility
//
//  Created by ke on 3/19/24.
//

import SwiftUI

struct ProgrammaticNavigationView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                Button("show 32"){
                    path = [32]
                }
                
                Button("show 64"){
                    path.append(64)
                    print(path)
                }
                
                Button("show 32 then 64"){
                    path = [32, 64]
                    print(path)
                }
            }
            .navigationDestination(for: Int.self){ selection in
                Text("you selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticNavigationView()
}
