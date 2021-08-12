//
//  WeatherCurrentView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 11.08.21.
//

import SwiftUI

import SDWebImageSwiftUI
import WeatherAPI

struct WeatherCurrentView: View {
    @State var data: ForecastResponse

    var body: some View {
        VStack {
            HStack {
                WebImage(url: data.currentForecast.weather?.icon)
                VStack(alignment: .leading) {
                    Text("Today")
                        .font(.system(size: 18.0))
                        .fontWeight(.medium)
                    Text(data.currentForecast.date.formatToString("EEE, dd MMM"))
                        .font(.system(size: 14.0))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
            }
            Text("\(Int(data.currentForecast.temperature))°")
                .font(.system(size: 80.0))
                .fontWeight(.light)
                .foregroundColor(.yellow)
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(data.currentForecast.suitableForWork ? Color.green : Color.gray, lineWidth: 4))
            Text(data.currentForecast.weather?.main ?? "")
                .font(.system(size: 14.0))
                .fontWeight(.medium)
                .foregroundColor(.gray)
            Text(data.timeZone ?? "")
                .font(.system(size: 16.0))
                .fontWeight(.medium)
        }
    }
}

//struct WeatherCurrentView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherCurrentView(data: HourlyForecast())
//    }
//}
