//
//  IWeatherListPresenter.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 7.08.21.
//

import Foundation

protocol IWeatherListPresenter: AnyObject, IPresenter {
    var output: IWeatherListScreenView? { get set }
//    func setupResponse(response: NewsListResponse)
}

protocol IPresenter {
    func showError(error: String)
    func showLoading()
    func hideLoading()
}
