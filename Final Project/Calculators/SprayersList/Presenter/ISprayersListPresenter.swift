//
//  ISprayersListPresenter.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 11.08.21.
//

import Foundation

protocol ISprayersListPresenter: AnyObject, IPresenter {
    var output: ISprayersListScreenView? { get set }
    func setupResponse(response: SprayersListResponse)
}
