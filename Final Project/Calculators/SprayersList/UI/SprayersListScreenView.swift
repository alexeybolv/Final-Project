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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
