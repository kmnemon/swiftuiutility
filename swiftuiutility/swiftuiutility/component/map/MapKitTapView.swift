//
//  MapKitTapView.swift
//  swiftuiutility
//
//  Created by ke on 4/5/24.
//

import SwiftUI
import MapKit


struct MapKitTapView: View {
    @State private var locations = [Location]()
    
    var body: some View {
        VStack{
            MapReader { proxy in
                Map() {
                    ForEach(locations) { location in
                        Annotation(location.name, coordinate: location.coordinate) {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundStyle(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(.circle)
                                .onLongPressGesture {
                                    locations.removeAll()
                                }
                        }
                    }
                }
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        let newLocation = Location(name: "New location", coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude))
                        locations.append(newLocation)
                    }
                }
            }
        }
    }
}

#Preview {
    MapKitTapView()
}
