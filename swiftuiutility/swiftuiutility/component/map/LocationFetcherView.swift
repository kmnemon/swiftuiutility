//
//  LocationFetcherView.swift
//  swiftuiutility
//
//  Created by ke on 11/6/24.
//

import SwiftUI
import CoreLocation

extension LocationFetcherView{
    class LocationFetcher: NSObject, CLLocationManagerDelegate {
        let manager = CLLocationManager()
        var lastKnownLocation: CLLocationCoordinate2D?

        override init() {
            super.init()
            manager.delegate = self
        }

        func start() {
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            lastKnownLocation = locations.first?.coordinate
        }
    }
}


struct LocationFetcherView: View {
    let locationFetcher = LocationFetcher()

    var body: some View {
        VStack {
            Button("Start Tracking Location") {
                locationFetcher.start()
            }

            Button("Read Location") {
                if let location = locationFetcher.lastKnownLocation {
                    print("Your location is \(location)")
                } else {
                    print("Your location is unknown")
                }
            }
        }
    }
}
