//
//  ICalculatorScreenPresenter.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 17.08.21.
//

import Foundation

protocol ICalculatorScreenPresenter: AnyObject, IPresenter {
    var output: ICalculatorScreenView? { get set }
    func setupResponse(response: NozzlesListResponse)
}
