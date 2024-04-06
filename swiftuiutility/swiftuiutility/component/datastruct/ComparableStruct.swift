//
//  ComparableStruct.swift
//  swiftuiutility
//
//  Created by ke on 4/5/24.
//

import SwiftUI

extension ComparableStruct {
    struct UserForCompare: Identifiable {
        let id = UUID()
        var firstName: String
        var lastName: String
    }
    
    struct UserForCompare2: Comparable, Identifiable {
        let id = UUID()
        var firstName: String
        var lastName: String
        
        static func <(lhs: UserForCompare2, rhs: UserForCompare2) -> Bool {
            lhs.lastName < rhs.lastName
        }
    }
}

struct ComparableStruct: View {
    let values = [1, 5, 3].sorted()
    
    let users = [
        UserForCompare(firstName: "android", lastName: "google"),
        UserForCompare(firstName: "ios", lastName: "apple"),
        UserForCompare(firstName: "windows", lastName: "microsoft")
    ].sorted {
        $0.lastName < $1.lastName
    }
    
    let users2 = [
        UserForCompare2(firstName: "android", lastName: "google"),
        UserForCompare2(firstName: "ios", lastName: "apple"),
        UserForCompare2(firstName: "windows", lastName: "microsoft")
    ].sorted()
    
    var body: some View {
        Section("1") {
            List(values, id: \.self) {
                Text(String($0))
            }
        }
        
        Section("2") {
            List(users) { user in
                Text("\(user.lastName), \(user.firstName)")
            }
        }
        
        Section("3") {
            List(users2) { user in
                Text("\(user.lastName), \(user.firstName)")
            }
        }
    }
}

#Preview {
    ComparableStruct()
}
