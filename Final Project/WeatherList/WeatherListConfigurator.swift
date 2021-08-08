//
//  WeatherListConfigurator.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 6.08.21.
//

import SwiftUI
import UIKit

class WeatherListConfigurator: IConfugator {

    static let shared = WeatherListConfigurator()

    func createScreen(_ data: Any?) -> UIViewController {
        var view = WeatherListScreenView()
        let presenter = WeatherListPresenter()
        let interactor = WeatherListInteractor()

        interactor.output = presenter
        presenter.output = view
        view.output = interactor

        let vc = UIHostingController<ContainerView<WeatherListScreenView>>(rootView: ContainerView(content: view))
//        view.setupParent(parent: vc)
        return vc
    }
}
