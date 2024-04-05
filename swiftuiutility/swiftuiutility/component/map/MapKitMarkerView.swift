//
//  MapKitMarkerView.swift
//  swiftuiutility
//
//  Created by ke on 4/5/24.
//

import SwiftUI
import MapKit

struct MapKitMarkerView: View {
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        Map {
            ForEach(locations) { location in
                Marker(location.name, coordinate: location.coordinate)
            }
        }
    }
}

#Preview {
    MapKitMarkerView()
}
