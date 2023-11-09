//
//  listView.swift
//  quakes
//
//  Created by Emmanuel Theodore on 1/26/22.
//

import SwiftUI


// takes a magnitude and returns an arrray of features filtered by magnitude
func filterByMagnitude(features: [feature], magnitude: Double, mode: Bool) -> [feature] {
    var filteredFeatures = [feature]()
    for feature in features {
        if mode {
            if feature.properties.mag <= magnitude + 1 && feature.properties.mag >= magnitude {
                filteredFeatures.append(feature)
            }
        }else{
            if feature.properties.mag == magnitude {
                filteredFeatures.append(feature)
            }
        }
    }
    return filteredFeatures
}

struct listView: View {
    @EnvironmentObject var quakeData: quakeData
    var QuakeManager = quakeManager()
    @State var quake: quakes?
    @State private var searchText: String = ""
    
    
    var quakes: [feature] {
        quakeData.previewQuake.features
    }
    var Quakes: [feature]? {
        quake?.features
    }
    
    // Create filiter for quakes based on magnitude
    var filteredQuakes: [feature]? {
        guard let quakes = Quakes else { return nil }
        return filterByMagnitude(features: quakes, magnitude: Double(searchText) ?? 0.0, mode: true)
    }
    
    var searchedQuakes: [feature]? {
        let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        if searchText.count == 0 {
            return Quakes ?? quakes
        } else if searchText.contains("."){
            guard let quakes = Quakes else { return nil }
            return filterByMagnitude(features: quakes, magnitude: Double(searchText) ?? 0.0, mode: false)
        } else if searchText.containsAny(of: numbers) {
            guard let quakes = Quakes else { return nil }
            return filterByMagnitude(features: quakes, magnitude: Double(searchText) ?? 0.0, mode: true)
        } else {
            return Quakes!.filter {
                $0.properties.place.contains(searchText)
            } 
        }
    }

    var body: some View {
        NavigationView{
            List {
                ForEach(searchedQuakes ?? quakes) { feature in
                    
                    NavigationLink {
                        DetailedView(feature: feature)
                    } label: {
                        ListElement(quake: feature)
                    }
                    .task {
                        do {
                            quake = try await QuakeManager.getQuakes()
                        } catch {
                            print("Error getting Quakes: \(error)")
                        }
                    }
                }
            }
            .navigationTitle("Quakes")
            .searchable(text: $searchText)
        }
        .preferredColorScheme(.dark)
    }
}

struct listView_Previews: PreviewProvider {
    static var previews: some View {
        listView()
    }
}
