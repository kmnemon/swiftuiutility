//
//  MainActorStruct.swift
//  swiftuiutility
//
//  Created by ke on 1/18/25.
//

import SwiftUI

/*
 1. MainActor
 For example, we could create an @Observable class with two properties, and because they will both update the UI we would mark the whole class with @MainActor to ensure these UI updates always happen on the main actor no matter where they are triggered from
 */
/*
 Now, in Xcode 16 and later SwiftUI was updated so that all structs that conform to View are automatically and entirely run on the main actor, which makes all this work a great deal easier. This is not attached to your deployment target – any iOS you compile using Xcode 16 or later benefits from this change.
 */
@Observable @MainActor
class AccountViewModel {
    var username = "Anonymous"
    var isAuthenticated = false
}


//2. run on main actor
func couldBeAnywhere() async {
    await MainActor.run {
        print("This is on the main actor.")
    }
}

// send back a value like this:
func couldBeAnywhere2() async {
   let result = await MainActor.run {
       print("This is on the main actor.")
       return 42
   }

   print(result)
}



func applyRunOnMainActor() async {
    await couldBeAnywhere()
}

//3. If you wanted the work to be sent off to the main actor without waiting for its result to come back, you can place it in a new task like this:
func couldBeAnywhere() {
    Task {
        await MainActor.run {
            print("This is on the main actor.")
        }
    }

    // more work you want to do
}
