//
//  WeatherListConfigurator.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 6.08.21.
//

import SwiftUI
import UIKit

class WeatherListConfigurator: IConfigurator {

    static let shared = WeatherListConfigurator()

    func createScreen(_ data: Any?) -> some View {
        var view = WeatherListScreenView()
        let presenter = WeatherListPresenter()
        let interactor = WeatherListInteractor()

        interactor.output = presenter
        presenter.output = view
        view.output = interactor

        return view
    }
}
