//
//  SprayersListInteractor.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 11.08.21.
//

import Foundation

import AgronomAPI
import Networking

enum SprayersListResponse {
    case success(response: [Sprayer])
    case error(error: String)
}

class SprayersListInteractor: ISprayersListInteractor {

    // MARK: - Variables

    var output: ISprayersListPresenter?

    // MARK: - API

    func getSprayersList() {
        output?.showLoading()
        NetworkAdapter.mockRequest(target: .getSprayers) { response in
            self.output?.hideLoading()
            do {
                let sprayersList = try JSONDecoder().decode([Sprayer].self, from: response.data)
                self.output?.setupResponse(response: .success(response: sprayersList))
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
