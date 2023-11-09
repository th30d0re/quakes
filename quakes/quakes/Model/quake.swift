//
//  quake.swift
//  quakes
//
//  Created by Emmanuel Theodore on 1/26/22.
//

//MARK: Imports
import Foundation
import CoreLocation

//MARK: Model

struct quakes: Codable, Hashable {
    var features: [feature]
}
struct feature: Hashable, Codable, Identifiable {
    var id: String
    var properties: properties
    var geometry: geometry

    struct properties: Hashable, Codable {
        var mag: Double
        var place: String
        var time: Double
        var tz: Int?
        var tsunami: Int

        static let defaultProperties = properties(
            mag: 1.1,
            place: "not_Haiti",
            time: 1,
            tz: 1,
            tsunami: 1//,
            //formatedTime: "0/00/000"
        )
//        var formatedTime: String {
//            // takes in a time Int and returns a formated time string
//            let date = Date(timeIntervalSince1970: Double(time))
//            let formatter = DateFormatter()
//            formatter.dateFormat = "MMM dd, yyyy"
//            return formatter.string(from: date)
//            }
//
//        }
    }

    struct geometry: Hashable, Codable {

        var coordinates: [Double]
        var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates[1],
                longitude: coordinates[0])
        }
        static let defaultGeometry = geometry(
            coordinates: [0.0,0.0,0.0])
    

    static let defaultFeature = feature(
        id: "1",
        properties: properties.defaultProperties,
        geometry: geometry.defaultGeometry
    )
    }
}
