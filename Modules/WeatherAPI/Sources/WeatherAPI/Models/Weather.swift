//
//  Weather.swift
//  
//
//  Created by Alexey Bolvonovich on 26.07.21.
//

import Foundation

public class Weather: Codable {

    public let id: Int
    public let main: String
    public let icon: URL
    public let weatherDescription: String

    private enum CodingKeys: String, CodingKey {
        case id, main, icon
        case weatherDescription = "description"
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(Int.self, forKey: .id)
        self.main = try container.decode(String.self, forKey: .main)
        self.weatherDescription = try container.decode(String.self, forKey: .weatherDescription)

        let iconString = try container.decode(String.self, forKey: .icon)
        self.icon = URL(string: "http://openweathermap.org/img/wn/\(iconString)@2x.png") ?? URL(fileURLWithPath: "")
    }
}
