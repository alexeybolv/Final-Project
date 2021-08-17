//
//  SprayersListScreenView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 11.08.21.
//

import SwiftUI

struct SprayersListScreenView: View {

    var output: ISprayersListInteractor?
    var container: IContainer?
    @ObservedObject var model: SprayerListViewModel =  SprayerListViewModel()

    var body: some View {
        VStack {
            List(model.data, id: \.id) { sprayer in
                NavigationLink(destination: (ModuleConfig.shared.config(screen: CalculatorScreenView.self) as? CalculatorScreenConfigurator)?.createScreen(nil)) {
                    Text(sprayer.name)
                }
            }
        }
        .navigationTitle("Nozzles calculator")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            output?.getSprayersList()
        }
    }
}

extension SprayersListScreenView: ISprayersListScreenView {

    var viewModel: IModel? {
        return model
    }

    func updateModel(data: Any?) {
        self.model.update(data: data)
    }
}

struct SprayersListView_Previews: PreviewProvider {
    static var previews: some View {
        SprayersListScreenView()
    }
}
