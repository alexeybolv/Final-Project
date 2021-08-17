//
//  WeatherInteractor.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 25.07.21.
//

import SwiftUI

import Moya
import Networking
import WeatherAPI

enum WeatherForecastResponse {
    case success(response: ForecastResponse)
    case error(error: String)
}

class WeatherInteractor: IWeatherInteractor {

    // MARK: - Variables

    var output: IWeatherPresenter?

    @AppStorage("widgetWeatherData", store: UserDefaults(suiteName: "group.com.alexeybolv.agronom"))
    var widgetWeatherData: Data = Data()

    // MARK: - API

    func getWeatherForecast() {
        output?.showLoading()
        NetworkAdapter.request(target: .getWeather(latitude: 53.893009, longitude: 27.567444, language: "en", appID: GlobalStrings.weatherAppID)) { response in
            self.output?.hideLoading()
            do {
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: response.data)

                let widgetWeather = WidgetWeather(date: Date(), temperature: forecastResponse.currentForecast.temperature, weatherName: forecastResponse.currentForecast.weather?.main ?? "", icon: forecastResponse.currentForecast.weather?.icon)
                if let widgetWeatherData = try? JSONEncoder().encode(widgetWeather) {
                    self.widgetWeatherData = widgetWeatherData
                }

                UserDefaults.standard.set(response.data, forKey: GlobalStrings.weatherResponseStorageKey)
                self.output?.setupResponse(response: .success(response: forecastResponse))
            } catch {
                self.output?.setupResponse(response: .error(error: error.localizedDescription))
            }
        } error: { error in
            self.output?.hideLoading()
            self.output?.setupResponse(response: .error(error: error.localizedDescription))
        } failure: { error in
            self.output?.hideLoading()
            self.output?.setupResponse(response: .error(error: error))
        }
    }
}
