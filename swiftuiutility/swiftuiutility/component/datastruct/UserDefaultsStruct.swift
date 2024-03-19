//
//  UserDefaultStruct.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/16.
//

import SwiftUI

//3. codable
struct UserB: Codable{
    let firstName: String
    let lastName: String
}

struct UserDefaultsStruct: View {
    //1. userDefaults-support strings, numbers, dates, URLs, binary data, arrays and dictionaries
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    //2. appstorage
    @AppStorage("tapCount2") private var tapCount2 = 0
    
    //3. Json
    @State private var user = UserB(firstName: "ui", lastName: "swift")
    
    var body: some View {
        Button("Tap Count: \(tapCount)"){
            tapCount += 1
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
        
        Button("TapCount2: \(tapCount2)"){
            tapCount2 += 1
        }
        
        Button("Save User"){
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user){
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    UserDefaultsStruct()
}
