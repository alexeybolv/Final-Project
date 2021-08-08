//
//  IWeatherListInteractor.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 7.08.21.
//

import Foundation

protocol IWeatherListInteractor : AnyObject {
    var output: IWeatherListPresenter? { get set }
    func getWeatherForecast()
}
