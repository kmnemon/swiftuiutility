//
//  EnvironmentCustom.swift
//  swiftuiutility
//
//  Created by ke Liu on 4/9/25.
//

import SwiftUI

//example 1:
struct FormElementIsRequiredKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var required: Bool {
        get {
            self[FormElementIsRequiredKey.self]
        } set {
            self[FormElementIsRequiredKey.self] = newValue
        }
    }
}

extension View {
    func required(_ makeRequired: Bool = true) -> some View {
        environment(\.required, makeRequired)
    }
}

struct RequirableTextField: View {
    @Environment(\.required) var required
    let title: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField(title, text: $text)
            
            if required {
                Image(systemName: "asterisk")
                    .imageScale(.small)
                    .foregroundStyle(.red)
            }
        }
    }
}


struct CustomEnvironmentExample: View {
    @State private var firstName = ""
    @State private var lastName = ""
    
    @State private var makeRequired: Bool = true
    
    var body: some View {
        Form {
            RequirableTextField(title: "First Name", text: $firstName)
            RequirableTextField(title: "Last Name", text: $lastName)
            //                .environment(\.required, true)
            //                .required()
            
            Toggle("Make required", isOn: $makeRequired.animation())
        }
        .required(makeRequired)
    }
}

//example 2:
struct StrokeWidthKey: EnvironmentKey {
    static var defaultValue = 1.0
}
extension EnvironmentValues {
    var strokeWidth: Double {
        get { self[StrokeWidthKey.self] }
        set { self[StrokeWidthKey.self] = newValue }
    }
}

extension View {
    func strokeWidth(_ width: Double) -> some View {
        environment(\.strokeWidth, width)
    }
}

struct CirclesView: View {
    @Environment(\.strokeWidth) var strokeWidth
    var body: some View {
        ForEach(0..<3) { _ in
            Circle()
                .stroke(.red, lineWidth: strokeWidth)
        }
    }
}

struct CustomEnvironmentExample2: View {
    @State private var sliderValue = 1.0
    var body: some View {
        VStack {
            CirclesView()
            Slider(value: $sliderValue, in: 1...10)
        }
        .strokeWidth(sliderValue)
    }
}
