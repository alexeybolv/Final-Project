//
//  CalculatorScreenView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 17.08.21.
//

import SwiftUI

struct CalculatorScreenView: View {

    var output: ICalculatorScreenInteractor?
    var container: IContainer?
    @ObservedObject var model: CalculatorScreenViewModel =  CalculatorScreenViewModel()

    var body: some View {
        Text("Hello")
    }
}

extension CalculatorScreenView: ICalculatorScreenView {

    var viewModel: IModel? {
        return model
    }

    func updateModel(data: Any?) {
        self.model.update(data: data)
    }
}

struct CalculatorScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorScreenView()
    }
}
