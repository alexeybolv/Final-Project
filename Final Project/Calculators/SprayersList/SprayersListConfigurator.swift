//
//  SprayersListConfigurator.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 11.08.21.
//

import SwiftUI

class SprayersListConfigurator: IConfigurator {

    static let shared = SprayersListConfigurator()

    func createScreen(_ data: Any?) -> some View {
        var view = SprayersListScreenView()
        let presenter = SprayersListPresenter()
        let interactor = SprayersListInteractor()

        interactor.output = presenter
        presenter.output = view
        view.output = interactor

        return ContainerView(content: view)
    }
}
