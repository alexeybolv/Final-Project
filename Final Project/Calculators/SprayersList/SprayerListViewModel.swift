//
//  SprayerListViewModel.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 11.08.21.
//

import Foundation

import AgronomAPI

class SprayerListViewModel: ObservableObject, IModel {

    var listener: IContainer?

    @Published var sprayersList: [Sprayer] = [Sprayer]()

    var data: [Sprayer] {
        get {
            return sprayersList
        }
    }

    func update(data: Any?) {
        if let data = data as? [Sprayer] {
            self.update(sprayersList: data)
        }
    }

    private func update(sprayersList: [Sprayer]) {
        self.sprayersList = sprayersList
    }
}
