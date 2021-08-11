//
//  IWeatherScreenView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 7.08.21.
//

import Foundation

protocol IWeatherScreenView: IModelView {
    var output: IWeatherInteractor? { get set }
    func updateModel(data: Any?)
}
