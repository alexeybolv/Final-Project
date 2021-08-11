//
//  WeatherPresenter.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 25.07.21.
//

import Foundation

import WeatherAPI

class WeatherPresenter: IWeatherPresenter {

    lazy var output: IWeatherScreenView? = nil

    func setupResponse(response: WeatherForecastResponse) {
        switch  response {
        case .error(let error):
            self.showError(error: error)
            if let forecastResponseData = UserDefaults.standard.object(forKey: GlobalStrings.weatherResponseStorageKey) as? Data {
                if let forecastResponse = try? JSONDecoder().decode(ForecastResponse.self, from: forecastResponseData) {
                    output?.updateModel(data: forecastResponse)
                }
            }
        case .success(let data):
            output?.updateModel(data: data)
        }
    }

    func showError(error: String) {
        output?.showError(error: error)
    }

    func showLoading() {
        output?.showLoading()
    }

    func hideLoading() {
        output?.hideLoading()
    }
}
