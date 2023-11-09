//
//  quakeData.swift
//  quakes
//
//  Created by Emmanuel Theodore on 1/26/22.
//

import Foundation
import Combine

var previewQuake: quakes = load("quakes.json")
var Quakes: [feature] = previewQuake.features

final class quakeData: ObservableObject {
    @Published var previewQuake: quakes = load("quakes.json")
    
    
}

final class quakeList: ObservableObject {
    @Published var quakes: [feature] = previewQuake.features
    
    
}
