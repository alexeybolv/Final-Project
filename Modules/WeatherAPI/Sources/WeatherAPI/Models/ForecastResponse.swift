//
//  ForecastResponse.swift
//  
//
//  Created by Alexey Bolvonovich on 25.07.21.
//

import Foundation

public class ForecastResponse: Decodable {

    let timeZone: String?
    let lat: Double?
    let lon: Double?

    let dailyForecasts: [DailyForecast]
    let hourlyForecasts: [HourlyForecast]

    private enum CodingKeys: String, CodingKey {
        case lat, lon
        case timeZone = "timezone"
        case dailyForecasts = "daily"
        case hourlyForecasts = "hourly"
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.timeZone = try container.decodeIfPresent(String.self, forKey: .timeZone)
        self.lat = try container.decodeIfPresent(Double.self, forKey: .lat)
        self.lon = try container.decodeIfPresent(Double.self, forKey: .lon)

        self.dailyForecasts = try container.decode([DailyForecast].self, forKey: .dailyForecasts)
        self.hourlyForecasts = try container.decode([HourlyForecast].self, forKey: .hourlyForecasts)
    }
}
