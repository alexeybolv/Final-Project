//
//  WeatherInteractor.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 25.07.21.
//

import Foundation

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

    // MARK: - API

    func getWeatherForecast() {
        output?.showLoading()
        NetworkAdapter.request(target: .getWeather(latitude: 53.893009, longitude: 27.567444, language: "en", appID: "96f6c15f795066aaabedaea09b627a6f")) { response in
            self.output?.hideLoading()
            do {
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: response.data)
                self.output?.setupResponse(response: .success(response: forecastResponse))
            } catch {
                self.output?.setupResponse(response: .error(error: error.localizedDescription))
            }
            print(response.description)
        } error: { error in
            self.output?.hideLoading()
            self.output?.setupResponse(response: .error(error: error.localizedDescription))
        } failure: { error in
            self.output?.hideLoading()
            self.output?.setupResponse(response: .error(error: error))
        }
    }
}
