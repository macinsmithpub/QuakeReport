//
//  QuakeModel.swift
//  Earthquake
//
//  Created by Stephen R Smith on 1/10/24.
//

import Foundation

struct QuakeMetadata : Codable {
    var generated: Int
    var url: String
    var title: String
}

struct Property : Codable {
    var mag: Decimal
    var place: String
    var time: Int
    let url: String
    let detail: String
    let title: String
}

struct Feature : Codable {
    var type: String
    var properties: Property
    var id: String
}

struct Earthquake : Codable {
    var type: String
    var features: [Feature]
}
