//
//  ISprayersListScreenView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 11.08.21.
//

import Foundation

protocol ISprayersListScreenView: IModelView {
    var output: ISprayersListInteractor? { get set }
    func updateModel(data: Any?)
}
