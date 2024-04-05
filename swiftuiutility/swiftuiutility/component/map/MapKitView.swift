//
//  MapKitView.swift
//  swiftuiutility
//
//  Created by ke on 4/5/24.
//

import SwiftUI
import MapKit

struct MapKitView: View {
    var body: some View {
        /*
         Map()
         Map(interactionModes: [])
         Map()
             .mapStyle(.imagery)
         */
        Map(interactionModes: [.rotate, .zoom])
            .mapStyle(.hybrid(elevation: .realistic))
    }
}

#Preview {
    MapKitView()
}
