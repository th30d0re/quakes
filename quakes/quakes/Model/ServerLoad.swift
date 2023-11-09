//
//  ServerLoad.swift
//  quakes
//
//  Created by Emmanuel Theodore on 1/27/22.
//

import Foundation

class quakeManager {
    func getQuakes() async throws -> quakes {
        let url_string = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson"
        
        guard let url = URL(string: url_string) else {fatalError("Missing URL")}
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching quake data")}
        let decodedData = try JSONDecoder().decode(quakes.self, from: data)
        return decodedData
    }
}
