//
//  ForecastResponse.swift
//  
//
//  Created by Alexey Bolvonovich on 25.07.21.
//

import Foundation

public class ForecastResponse: Decodable {

    public let timeZone: String?
    public let lat: Double?
    public let lon: Double?

    public let currentForecast: HourlyForecast
    public let dailyForecasts: [DailyForecast]
    public let hourlyForecasts: [HourlyForecast]

    private enum CodingKeys: String, CodingKey {
        case lat, lon
        case timeZone = "timezone"
        case currentForecast = "current"
        case dailyForecasts = "daily"
        case hourlyForecasts = "hourly"
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.timeZone = try container.decodeIfPresent(String.self, forKey: .timeZone)
        self.lat = try container.decodeIfPresent(Double.self, forKey: .lat)
        self.lon = try container.decodeIfPresent(Double.self, forKey: .lon)

        self.currentForecast = try container.decode(HourlyForecast.self, forKey: .currentForecast)
        self.dailyForecasts = try container.decode([DailyForecast].self, forKey: .dailyForecasts)
        self.hourlyForecasts = try container.decode([HourlyForecast].self, forKey: .hourlyForecasts)
    }
}
