//
//  WeatherViewModel.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 4.08.21.
//

import Foundation
import WeatherAPI
import Combine

class WeatherViewModel: ObservableObject, IModel {

    var listener: IContainer?

    @Published var forecastResponse: ForecastResponse?

    var dailyForecasts: [DailyForecast] {
        get {
            return forecastResponse?.dailyForecasts ?? []
        }
    }

    var hourlyForecasts: [HourlyForecast] {
        get {
            return forecastResponse?.hourlyForecasts ?? []
        }
    }
    
    func update(data: Any?) {
        if let data = data as? ForecastResponse {
            self.updateForecastResponse(forecastResponse: data)
        }
    }

    private func updateForecastResponse(forecastResponse: ForecastResponse) {
        self.forecastResponse = forecastResponse
    }
}
