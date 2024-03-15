//
//  CustomBindingView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/11.
//

import SwiftUI

struct CustomBindingView: View {
    @State private var selection = 0
    
    @State private var agreedToTerms = false
    @State private var agreedToPrivacyPolicy = false
    @State private var agreedTOEmails = false
    
    var body: some View {
        let binding = Binding(
            get: { selection },
            set: { selection = $0 }
        )
        
        let agreedToAll = Binding<Bool>(
            get: {
                agreedToTerms && agreedToPrivacyPolicy && agreedTOEmails
            },
            set: {
                agreedToTerms = $0
                agreedToPrivacyPolicy = $0
                agreedTOEmails = $0
            }
        )
        
        return VStack{
            Picker("Select a number", selection: binding){
                ForEach(0..<3){
                    Text("Item \($0)")
                }
            }
            .pickerStyle(.segmented)
            
            Toggle("Agree to terms", isOn: $agreedToTerms)
            Toggle("Agree to privacy policy", isOn: $agreedToPrivacyPolicy)
            Toggle("Agree to receive shipping emails", isOn: $agreedTOEmails)
            Toggle("Agree to all", isOn: agreedToAll)

        }
    }
}

#Preview {
    CustomBindingView()
}
