//
//  AccessibilityDataView.swift
//  swiftuiutility
//
//  Created by ke on 4/6/24.
//

import SwiftUI

struct AccessibilityDataView: View {
    var body: some View {
        VStack {
            Image(decorative: "zelda-botw-logo_2x")
                .resizable()
                .scaledToFit()
            
            Image(.zeldaBotwLogo2X)
                .resizable()
                .scaledToFit()
                .accessibilityHidden(true)
            
            //group
            VStack {
                Text("Your score is")
                
                Text("1000")
                    .font(.title)
            }
            .accessibilityElement(children: .combine)

            //group
            VStack {
                Text("Your score is")
                
                Text("1000")
                    .font(.title)
            }
            //default is .ignore
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Your score is 1000")
       
        }
    }
}

#Preview {
    AccessibilityDataView()
}
