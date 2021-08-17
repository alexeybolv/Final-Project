//
//  CalculatorScreenInteractor.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 17.08.21.
//

import Foundation

import AgronomAPI
import Networking

enum NozzlesListResponse {
    case success(response: [Nozzle])
    case error(error: String)
}

class CalculatorScreenInteractor: ICalculatorScreenInteractor {

    // MARK: - Variables

    var output: ICalculatorScreenPresenter?

    // MARK: - API

    func getNozzlesList() {
        output?.showLoading()
        NetworkAdapter.mockRequest(target: .getNozzles) { response in
            self.output?.hideLoading()
            do {
                let nozzlesList = try JSONDecoder().decode([Nozzle].self, from: response.data)
                self.output?.setupResponse(response: .success(response: nozzlesList))
            } catch {
                self.output?.setupResponse(response: .error(error: error.localizedDescription))
            }
        } error: { error in
            self.output?.hideLoading()
            self.output?.setupResponse(response: .error(error: error.localizedDescription))
        } failure: { error in
            self.output?.hideLoading()
            self.output?.setupResponse(response: .error(error: error))
        }
    }
}
