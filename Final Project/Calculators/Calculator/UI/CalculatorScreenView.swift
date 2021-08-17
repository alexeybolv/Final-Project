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
    @ObservedObject var model: CalculatorScreenViewModel = CalculatorScreenViewModel()

    @State private var consumption: Double = 500
    @State private var speed: Double = 10
    @State private var width: Double = 10

    var body: some View {
        VStack {
            Spacer(minLength: 16)
            HStack {
                Image(systemName: "minus.rectangle.portrait")
                VStack {
                    Text("Расход: \(Int(consumption)) л/га")
                    Slider(value: $consumption, in: 0...1000)
                        .onChange(of: consumption) { _ in
                            model.sortNozzles(consumption: consumption, speed: speed, width: width)
                        }
                }
                Image(systemName: "plus.rectangle.portrait")
            }

            HStack {
                Image(systemName: "minus.rectangle.portrait")
                VStack {
                    Text("Скорость: \(Int(speed)) км/ч")
                    Slider(value: $speed, in: 5...25)
                        .onChange(of: speed) { _ in
                            model.sortNozzles(consumption: consumption, speed: speed, width: width)
                        }
                }
                Image(systemName: "plus.rectangle.portrait")
            }

            HStack {
                Image(systemName: "minus.rectangle.portrait")
                VStack {
                    Text("Ширина захвата: \(Int(width)) м")
                    Slider(value: $width, in: 2...24)
                        .onChange(of: width) { _ in
                            model.sortNozzles(consumption: consumption, speed: speed, width: width)
                        }
                }
                Image(systemName: "plus.rectangle.portrait")
            }

            Spacer()

            List(model.data, id: \.id) { nozzle in
                Text(nozzle.name)
            }
        }
        .onAppear {
            output?.getNozzlesList()
        }
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
