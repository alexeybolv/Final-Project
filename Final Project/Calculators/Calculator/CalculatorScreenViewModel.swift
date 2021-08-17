//
//  CalculatorScreenViewModel.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 17.08.21.
//

import Foundation

import AgronomAPI

class CalculatorScreenViewModel: ObservableObject, IModel {

    var listener: IContainer?

    @Published var nozzlesList: [Nozzle] = [Nozzle]()

    var data: [Nozzle] {
        get {
            return nozzlesList
        }
    }

    func update(data: Any?) {
        if let data = data as? [Nozzle] {
            self.update(nozzlesList: data)
        }
    }

    private func update(nozzlesList: [Nozzle]) {
        self.nozzlesList = nozzlesList
    }
}
