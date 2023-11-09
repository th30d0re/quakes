//
//  quakesApp.swift
//  quakes
//
//  Created by Emmanuel Theodore on 1/26/22.
//

import SwiftUI

@main
struct quakesApp: App {
    var body: some Scene {
        WindowGroup {
            listView()
                .environmentObject(quakeData())
        }
    }
}
