//
//  WeatherScreenView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 5.07.21.
//

import SwiftUI

struct WeatherScreenView: View {

    var output: IWeatherInteractor?
    var container: IContainer?
    @ObservedObject var model: WeatherViewModel =  WeatherViewModel()

    var body: some View {
        VStack {
            if let forecastResponse = model.forecastResponse {
                WeatherCurrentView(data: forecastResponse)
                WeatherHourlyView(data: model.hourlyForecasts)
                List(model.dailyForecasts, id: \.dateDouble) { forecast in
                    WeatherDailyView(data: forecast)
                }
            }
        }
        .onAppear {
            if model.forecastResponse == nil {
                output?.getWeatherForecast()
            }
        }
    }
}

struct WeatherListScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherScreenView()
    }
}

extension WeatherScreenView: IWeatherScreenView {

    var viewModel: IModel? {
        return model
    }

    func updateModel(data: Any?) {
        self.model.update(data: data)
    }
}
