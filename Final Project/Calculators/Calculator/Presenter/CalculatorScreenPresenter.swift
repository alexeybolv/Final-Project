//
//  CalculatorScreenPresenter.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 17.08.21.
//

import Foundation

class CalculatorScreenPresenter: ICalculatorScreenPresenter {

    lazy var output: ICalculatorScreenView? = nil

    func setupResponse(response: NozzlesListResponse) {
        switch  response {
        case .error(let error):
            self.showError(error: error)
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
