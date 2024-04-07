//
//  Loop.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/8.
//

import SwiftUI

struct PickerView: View {
    let students = ["Harry", "hermone", "Ron"]
    @State private var selectedStudent = "Harry"
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        Section("1") {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id:\.self) {
                        Text($0)
                    }
                }
                
                Text("Your selection is: \(selectedStudent)")
            }
            
            NavigationStack {
                Form {
                    Section {
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2..<10) {
                                Text("\($0) people")
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                    
                    Section("How much  do you want to tip?  ") {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(tipPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }
                .navigationTitle("WeSplit")
            }
        }
    }
}

#Preview {
    PickerView()
}
