//
//  MapKitTapView.swift
//  swiftuiutility
//
//  Created by ke on 4/5/24.
//

import SwiftUI
import MapKit

extension MapKitTapView {
    struct Location: Identifiable {
        let id = UUID()
        var name: String
        var coordinate: CLLocationCoordinate2D
    }
}


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
                }//The .local part means we're converting that position in the map's local coordinate space, meaning that the tap location we're working with is relative to the top-left corner of the map rather than the whole screen or some other coordinate space.
                //.global it goes to the very root of the whole screen rather as a root of where the map actually is
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) { //.global
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
