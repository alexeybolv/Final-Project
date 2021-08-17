//
//  ICalculatorScreenView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 17.08.21.
//

import Foundation

protocol ICalculatorScreenView: IModelView {
    var output: ICalculatorScreenInteractor? { get set }
    func updateModel(data: Any?)
}
