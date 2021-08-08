//
//  WeatherListInteractor.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 25.07.21.
//

import Foundation

import Moya
import Networking

class WeatherListInteractor: IWeatherListInteractor {

    var output: IWeatherListPresenter?

    func getWeatherForecast() {
        NetworkAdapter.request(target: .getWeather(latitude: 53.893009, longitue: 27.567444)) { response in
            print(response.description)
        } error: { error in
            print(error.localizedDescription)
        } failure: { error in
            print(error)
        }
    }
}
