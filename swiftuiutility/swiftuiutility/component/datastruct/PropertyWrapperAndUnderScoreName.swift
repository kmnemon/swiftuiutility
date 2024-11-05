//
//  PropertyWrapperAndUnderScoreName.swift
//  swiftuiutility
//
//  Created by ke on 2024/11/5.
//

import SwiftUI

/*
 self._name is the @State struct itself
 self.name, equivalent to self._name.wrappedValue. You would use this when rendering in the view's body
 self.$name, equivalent to self._name.projectedValue. You would pass this down to child views if they need to be able to change the name. <Binding<String>> has this one, i am not sure State really has this one
 */

struct PropertyWrapperAndUnderScoreName: View {
    @State private var name: String
    
    var body: some View {
        Text(name)
    }
    
    init(name: String) {
        _name = State(initialValue: name) // this is mean create the State struct
    }
}
