//
//  DetailedView.swift
//  quakes
//
//  Created by Emmanuel Theodore on 1/26/22.
//

import SwiftUI

struct DetailedView: View {
    @EnvironmentObject var quakeList: quakeList
    
    var feature: feature
    var featureIndex: Int {
        $quakeList.quakes.firstIndex(where: { $0.id == feature.id })!
        }
    var body: some View {
        let place = feature.properties.place
        let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        
        VStack {
            Spacer()
            Spacer()
                .padding(10)
            if place.containsAny(of: numbers) {
                let placeCountry = place.components(separatedBy: "of")[1]
                let directions = place.components(separatedBy: "of")[0]
                HStack {
                    Text(directions)
                        .foregroundColor(.gray)
                    Text(placeCountry)
                        .bold()
                        .font(.title)
                }
            }else {
                HStack {
                    Text(place)
                        .bold()
                        .font(.title)
                        .padding()
                }
            }
            
            
            Spacer()
            HStack {
               
                let Mag = feature.properties.mag
                let mag: String = String(format: "%.2f", Mag)
                Text("Mag: \(mag)")
                    .bold()
                    .font(.title2)
                Text("\(tsunami(num: feature.properties.tsunami))")
                
            }.padding(10)
            Spacer()
            MapView(coordinate: feature.geometry.locationCoordinate)
                .frame(height: 800)
                .ignoresSafeArea(edges: .bottom)
            
            .preferredColorScheme(.dark)
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static let QuakeList = quakeList()
    static var previews: some View {
        DetailedView(feature: QuakeList.quakes[4])
    }
}
