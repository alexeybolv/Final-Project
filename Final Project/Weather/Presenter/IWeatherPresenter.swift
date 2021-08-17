//
//  IWeatherPresenter.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 7.08.21.
//

import Foundation

protocol IWeatherPresenter: AnyObject, IPresenter {
    var output: IWeatherScreenView? { get set }
    func setupResponse(response: WeatherForecastResponse)
}
