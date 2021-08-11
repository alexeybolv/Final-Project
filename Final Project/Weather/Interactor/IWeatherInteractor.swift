//
//  IWeatherInteractor.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 7.08.21.
//

import Foundation

protocol IWeatherInteractor : AnyObject {
    var output: IWeatherPresenter? { get set }
    func getWeatherForecast()
}
