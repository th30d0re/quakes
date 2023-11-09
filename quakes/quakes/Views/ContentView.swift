//
//  ContentView.swift
//  quakes
//
//  Created by Emmanuel Theodore on 1/26/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var quakeData: quakeData
    var body: some View {
        NavigationView{
            listView()
            Spacer()
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(quakeData())
    }
}
