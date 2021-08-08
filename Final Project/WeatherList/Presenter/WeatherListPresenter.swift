//
//  WeatherListPresenter.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 25.07.21.
//

import Foundation

class WeatherListPresenter: IWeatherListPresenter {

    lazy var output: IWeatherListScreenView? = nil

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
