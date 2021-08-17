//
//  CalculatorScreenConfigurator.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 17.08.21.
//

import SwiftUI

class CalculatorScreenConfigurator: IConfigurator {

    static let shared = CalculatorScreenConfigurator()

    func createScreen(_ data: Any?) -> some View {
        var view = CalculatorScreenView()
        let presenter = CalculatorScreenPresenter()
        let interactor = CalculatorScreenInteractor()

        interactor.output = presenter
        presenter.output = view
        view.output = interactor

        return ContainerView(content: view)
    }
}
