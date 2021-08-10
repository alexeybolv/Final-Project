//
//  ITabBarScreenView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 8.08.21.
//

import Foundation

protocol ITabBarScreenView: IModelView {
    var output: ITabBarScreenInteractor? { get set }
}
