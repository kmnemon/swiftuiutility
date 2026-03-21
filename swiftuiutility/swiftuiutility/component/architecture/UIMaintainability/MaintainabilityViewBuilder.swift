//
//  MaintainabilityViewBuilder.swift
//  SwiftArchitecture
//
//  Created by ke Liu on 3/21/26.
//

import SwiftUI

//4. using the ViewBuilder
struct Maintainability_ViewBuilderIntro: View {
    var body: some View {
        ScrollView {
            VStack {
                CardView(title: "Employee Profile" ) {
                    HStack {
                        Image(systemName: "person.circle")
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text("Susan McNall")
                                .font(.title2.weight(.medium))
                            Text("IT Department")
                        }
                        Spacer()
                    }
                }
               
                CardView(title: "Expenses" ) {
                    LabeledContent("Flight", value: 580, format: .currency(code: "USD"))
                    LabeledContent("Hotel", value: 1600, format: .currency(code: "USD"))
                    LabeledContent("Meals", value: 418, format: .currency(code: "USD"))
                }
            }
        }
    }
}
