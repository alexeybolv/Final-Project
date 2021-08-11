//
//  WeatherConfigurator.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 6.08.21.
//

import SwiftUI

class WeatherConfigurator: IConfigurator {

    static let shared = WeatherConfigurator()

    func createScreen(_ data: Any?) -> some View {
        var view = WeatherScreenView()
        let presenter = WeatherPresenter()
        let interactor = WeatherInteractor()

        interactor.output = presenter
        presenter.output = view
        view.output = interactor

        return ContainerView(content: view)
    }
}
