//
//  UnitStruct.swift
//  swiftuiutility
//
//  Created by ke on 2024/9/10.
//

import Foundation

class UnitStruct {
    func convertLength() {
        let heightFeet = Measurement(value: 6, unit: UnitLength.feet)

        let heightInches = heightFeet.converted(to: UnitLength.inches)
        let heightSensible = heightFeet.converted(to: UnitLength.meters)
        let heightAUs = heightFeet.converted(to: UnitLength.astronomicalUnits)
    }
    
    func convertDegrees() {
        let degrees = Measurement(value: 180, unit: UnitAngle.degrees)
        let radians = degrees.converted(to: .radians)
    }
    
    func convertSquareMeters() {
        let squareMeters = Measurement(value: 4, unit: UnitArea.squareMeters)
        let squareCentimeters = squareMeters.converted(to: .squareCentimeters)
    }
    
    func convertBushels() {
        let bushels = Measurement(value: 6, unit: UnitVolume.bushels)
        let teaspoons = bushels.converted(to: .imperialTeaspoons)
    }
}
