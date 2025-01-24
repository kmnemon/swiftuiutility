//
//  QueryAnimate.swift
//  swiftuiutility
//
//  Created by ke on 2025/1/24.
//

import SwiftData
import SwiftUI


struct QueryAnimate {
    @Model
    class User {
        var name: String
        var age: Int
        
        init(name: String, age: Int) {
            self.name = name
            self.age = age
        }
    }
    

    struct QueryAnimateView: View {
        @Query(sort: \User.age, animation: .default) var users: [User]

        var body: some View {
            Text("")
        }
    }
    
    
    
    
}
