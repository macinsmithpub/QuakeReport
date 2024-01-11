//
//  QuakeView.swift
//  Earthquake
//
//  Created by Stephen R Smith on 1/10/24.
//

import SwiftUI

struct QuakeView: View {
    let magnitude: Decimal
    let place: String
    let when: Int
    
    var body: some View {
        let quakeDate = Date(timeIntervalSince1970: Double(when/1000))
        VStack(alignment: .leading) {
            Text(place)
                .font(.title)
            Text("magnitude \(magnitude.formatted(.number))")
                .font(.title2)
            Text("time: \(quakeDate.formatted(.dateTime)) GMT")
        }
//        .background(Color.gray)
    }
}

#Preview {
    QuakeView(magnitude: 4.5, place: "Big Sur", when: 1704930976277)
}
