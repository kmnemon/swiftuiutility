//
//  NavigationStackCustomizeView.swift
//  swiftuiutility
//
//  Created by ke on 3/19/24.
//

import SwiftUI

struct NavigationStackCustomizeView: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        Section("1"){
            NavigationStack{
                List(0..<30){ i in
                    Text("Row \(i)")
                }
                .navigationTitle("Title goes here")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.blue)
                //            .toolbarBackground(.blue, for: .tabBar)
                .toolbarColorScheme(.dark)
                .toolbar(.hidden, for: .navigationBar)
            }
        }
        
        Section("2"){
            NavigationStack{
                Text("Hello World")
                    .toolbar{
                        ToolbarItem(placement: .topBarLeading){
                            Button("Tap Me"){
                                // button action code
                            }
                        }
                        
                        ToolbarItem(placement: .topBarLeading){
                            Button("Tap Me2 "){
                                // button action code
                            }
                        }
                        
                        ToolbarItemGroup(placement: .topBarLeading){
                            Button("Tap Me 3"){
                                // button action code
                            }
                            Button("Tap Me 4"){
                                // button action code
                            }
                        }
                    }
                    .navigationBarBackButtonHidden()
            }
        }
        
        Section("3"){
            NavigationStack{
                Text("Hello, world")
                    .navigationTitle($title)
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    NavigationStackCustomizeView()
}
