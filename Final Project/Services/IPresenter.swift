//
//  IPresenter.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 11.08.21.
//

import Foundation

protocol IPresenter {
    func showError(error: String)
    func showLoading()
    func hideLoading()
}
