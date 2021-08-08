//
//  ContainerModel.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 6.08.21.
//

import Foundation
import Combine

class ContainerModel: ObservableObject {
    
    @Published var hasError: Bool = false
    @Published var errorText: String = ""
    @Published var isLoading: Bool = false

    func setupError(error: String){
        self.errorText = error
        if (!error.isEmpty) {
            self.hasError = true
        }
    }

    func errorShown() {
        self.hasError = false
        self.errorText = ""
    }

    func showLoading() {
        self.isLoading = true
    }

    func hideLoading() {
        self.isLoading = false
    }
}
