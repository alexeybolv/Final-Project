//
//  WeatherListScreenView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 5.07.21.
//

import SwiftUI

struct WeatherListScreenView: View {

    var output: IWeatherListInteractor?
    var container: IContainer?
    @ObservedObject var model: WeatherListViewModel =  WeatherListViewModel()

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WeatherListScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListScreenView()
    }
}

extension WeatherListScreenView: IWeatherListScreenView {

    var viewModel: IModel? {
        return model
    }
}
