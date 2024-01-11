//
//  ContentView.swift
//  QuakeReport
//
//  Created by Stephen R Smith on 1/10/24.
//
// GeoJSON Summary Format: https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php
//

import SwiftUI

struct ContentView: View {
    let quakeURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson"
    @State private var features = [Feature]()
    
    var body: some View {
        Text("\(features.count) Earthquakes")
            .font(.title)
        Text("(past 24 hours)")
            .font(.title2)
        List(features, id: \.id) { item in
            VStack(alignment: .leading) {
                QuakeView(
                    magnitude: item.properties.mag,
                    place: item.properties.place,
                    when: item.properties.time
                )
            }
        }
        .task {
            await loadQuakes()
        }
        
    }
    
    func loadQuakes() async {
        guard let url = URL(string: quakeURL) else {
            print("invalid URL")
            return
        }
        
        do {
            print("url \(url)")
            let (data, response) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(Earthquake.self, from: data) {
                features = decodedResponse.features
            } else {
                print("no data, response=\(response)")
            }
        } catch {
            print("error \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
