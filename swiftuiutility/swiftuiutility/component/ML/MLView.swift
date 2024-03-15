//
//  MLView.swift
//  swiftuiutility
//
//  Created by ke on 2024/3/14.
//

import SwiftUI
import CoreML

struct MLView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func calculateBedtime(){
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let prediction = try model.prediction(wake: 0.0, estimatedSleep: 0.0, coffee: 0.0)
            let sleepTime = .now - prediction.actualSleep
            print(sleepTime.formatted(date: .omitted, time: .shortened))
        }catch{
            
        }
    }
}

#Preview {
    MLView()
}
