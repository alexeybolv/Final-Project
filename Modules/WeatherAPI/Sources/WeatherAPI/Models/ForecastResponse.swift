//
//  ForecastResponse.swift
//  
//
//  Created by Alexey Bolvonovich on 25.07.21.
//

import Foundation

class ForecastResponse: Decodable {

    let timeZone: String?
    let lat: Double?
    let lon: Double?

    private enum CodingKeys: String, CodingKey {
        case lat, lon
        case timeZone = "timezone"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.timeZone = try container.decodeIfPresent(String.self, forKey: .timeZone)
        self.lat = try container.decodeIfPresent(Double.self, forKey: .lat)
        self.lon = try container.decodeIfPresent(Double.self, forKey: .lon)
    }
}
