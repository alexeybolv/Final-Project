//
//  ICalculatorScreenInteractor.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 17.08.21.
//

import Foundation

protocol ICalculatorScreenInteractor : AnyObject {
    var output: ICalculatorScreenPresenter? { get set }
    func getNozzlesList()
}
