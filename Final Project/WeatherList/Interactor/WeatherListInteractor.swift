//
//  WeatherListInteractor.swift
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

class WeatherListInteractor: IWeatherListInteractor {

    // MARK: - Variables

    var output: IWeatherListPresenter?

    // MARK: - API

    func getWeatherForecast() {
        output?.showLoading()
        NetworkAdapter.request(target: .getWeather(latitude: 53.893009, longitude: 27.567444, language: "ru", appID: "96f6c15f795066aaabedaea09b627a6f")) { response in
            self.output?.hideLoading()
            do {
                let weatherForecast = try JSONDecoder().decode(ForecastResponse.self, from: response.data)
            } catch {
                print(error.localizedDescription)
            }
            print(response.description)
        } error: { error in
            self.output?.hideLoading()
        } failure: { error in
            self.output?.hideLoading()
            print(error)
        }
    }
}
