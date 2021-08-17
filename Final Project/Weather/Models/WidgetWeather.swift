//
//  WidgetWeather.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 12.08.21.
//

import Foundation

public class WidgetWeather: Codable {

    let date: Date
    let temperature: Double
    let weatherName: String
    let icon: URL?

    init(date: Date, temperature: Double, weatherName: String, icon: URL?) {
        self.date = date
        self.temperature = temperature
        self.weatherName = weatherName
        self.icon = icon
    }
}
