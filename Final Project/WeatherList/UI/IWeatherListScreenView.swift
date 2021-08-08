//
//  IWeatherListScreenView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 7.08.21.
//

import Foundation

protocol IWeatherListScreenView: IModelView {
    var output: IWeatherListInteractor? {get set}
}
