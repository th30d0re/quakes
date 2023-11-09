//
//  ListElement.swift
//  quakes
//
//  Created by Emmanuel Theodore on 1/26/22.
//

import SwiftUI

func tsunami(num: Int) -> String {
    if num != 0 {
        return "🌊"
    }else {
        return ""
    }
}

func title(string: String) -> [String] {
    let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    if string.containsAny(of: numbers) {
        let directions = string.components(separatedBy: "of")[0]
        let country = string.components(separatedBy: "of")[1]
        return [directions,country]
    } else {
        let directions = string.components(separatedBy: "of")[0]
        return [directions,""]
    }
}

func colorScale(mag: Double) -> Color {
    // Takes in a magnitude and returns a color baced on how strong the quake is
    if mag < 1.0 {
        return Color.blue
    } else if mag < 2.0 {
        return Color.cyan
    } else if mag < 3.0 {
        return Color.green
    } else if mag < 4.0 {
        return Color.orange
    }else if mag < 5.0 {
        return Color.red
    }else if mag < 6.0 {
        return Color.indigo
    } else {
        return Color.purple
    }
}

// Time formatter, takes in a time Double and a optinal Timezone offset from UTC in minutes as a Int and returns a formated time string
func timeFormatter(time: Double, offset: Int? = nil) -> String {
    let date = Date(timeIntervalSince1970: time)
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone(identifier: "UTC")
    formatter.dateFormat = "MMM d, h:mm a"
    if let offset = offset {
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.timeZone = TimeZone(secondsFromGMT: offset * 60)
    }
    return formatter.string(from: date)
}


struct ListElement: View {

    var quake: feature
   
    var body: some View {
        VStack{
            HStack {
                let place = quake.properties.place
                let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
                if place.containsAny(of: numbers) {
                    VStack (alignment: .leading) {
                        HStack{
                        Text("\(title(string: place)[1])")
                            .bold()
                            .foregroundColor(colorScale(mag: quake.properties.mag))
                            
                       
                            Text("\(timeFormatter(time:quake.properties.time ))")
                        }
                        Text(place)
                            .foregroundColor(.gray)
                    }
                }else{
                    VStack (alignment: .leading) {
                        Text(place)
                            .bold()
                            .foregroundColor(colorScale(mag: quake.properties.mag))
                        Text("\(timeFormatter(time:quake.properties.time))")
                    }
                }
                
                Spacer()
                VStack{
                    let Mag = quake.properties.mag
                    let mag: String = String(format: "%.2f", Mag)
                    Text("Mag: \(mag)")
                        .bold()
                        .foregroundColor(colorScale(mag: quake.properties.mag))
                        
                    Text(tsunami(num: quake.properties.tsunami))
                }
                .padding(3)
                .preferredColorScheme(.dark)
                
            }
        }
    }
}

struct ListElement_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListElement(quake: Quakes[0])
                .previewLayout(.fixed(width: 300, height: 70))
            ListElement(quake: Quakes[1])
                .previewLayout(.fixed(width: 300, height: 70))
            ListElement(quake: Quakes[4])
                .previewLayout(.fixed(width: 300, height: 70))
        }
    }
}
