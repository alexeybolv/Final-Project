//
//  TabBarViewModel.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 8.08.21.
//

import Foundation

import Combine

class TabBarViewModel: ObservableObject, IModel {

    @Published var selection: Int = 0

    func update(data: Any?) {
    }

    var listener: IContainer?
}
