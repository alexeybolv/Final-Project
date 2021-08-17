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

    var nozzlesList: [Nozzle] = [Nozzle]()
    @Published var sortedNozzlesList: [Nozzle] = [Nozzle]()

    var data: [Nozzle] {
        get {
            return sortedNozzlesList
        }
    }

    func update(data: Any?) {
        if let data = data as? [Nozzle] {
            self.update(nozzlesList: data)
        }
    }

    func sortNozzles(consumption: Double, speed: Double, width: Double) {
        sortedNozzlesList = nozzlesList.filter({ speed > $0.minSpeed && speed < $0.maxSpeed && $0.consumption > consumption })
    }

    private func update(nozzlesList: [Nozzle]) {
        self.nozzlesList = nozzlesList
        self.sortedNozzlesList = nozzlesList
    }
}
