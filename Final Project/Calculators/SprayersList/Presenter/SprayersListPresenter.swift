//
//  SprayersListPresenter.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 11.08.21.
//

import Foundation

class SprayersListPresenter: ISprayersListPresenter {

    lazy var output: ISprayersListScreenView? = nil

//    func setupResponse(response: WeatherForecastResponse) {
//        switch  response {
//        case .error(let error):
//            self.showError(error: error)
//        case .success(let data):
//            output?.updateModel(data: data)
//        }
//    }

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
