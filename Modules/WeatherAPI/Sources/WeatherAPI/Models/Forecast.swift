//
//  Forecast.swift
//  
//
//  Created by Alexey Bolvonovich on 25.07.21.
//

import Foundation

public class Forecast: Codable {

    public let dateDouble: Double
    public let date: Date
    public let humidity: Int
    public let weather: Weather?

    private enum CodingKeys: String, CodingKey {
        case date = "dt"
        case humidity, weather
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.dateDouble = try container.decode(Double.self, forKey: .date)
        self.date = Date(timeIntervalSince1970: dateDouble)
        self.humidity = try container.decode(Int.self, forKey: .humidity)

        let allWeather = try container.decode([Weather].self, forKey: .weather)
        self.weather = allWeather.first
    }
}

public class HourlyForecast: Forecast {

    public let temperature: Double

    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.temperature = try container.decode(Double.self, forKey: .temperature)

        try super.init(from: decoder)
    }
}

public class DailyForecast: Forecast {

    public let temperature: Temperature

    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.temperature = try container.decode(Temperature.self, forKey: .temperature)

        try super.init(from: decoder)
    }
}
