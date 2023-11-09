//
//  MapView.swift
//  quakes
//
//  Created by Emmanuel Theodore on 1/26/22.
//

import SwiftUI
import MapKit


struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    var zoom: Double = 3
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate, zoom: zoom)
            }
    }
    
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D, zoom: Double) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: zoom, longitudeDelta: zoom)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 71.09921, longitude: 42.33293 ), zoom: 5)
    }
}

