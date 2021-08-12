//
//  WeatherHourlyView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 11.08.21.
//

import SwiftUI

import SDWebImageSwiftUI
import WeatherAPI

struct WeatherHourlyView: View {
    @State var data: [HourlyForecast]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(data.enumerated()), id: \.offset) { offset, forecast in
                    VStack(spacing: 10) {
                        Spacer(minLength: 6)
                        Text(offset == 0 ? "Now" : forecast.date.formatToString("HH:mm"))
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                        WebImage(url: forecast.weather?.icon)
                        Text("\(Int(forecast.temperature))°")
                            .font(.system(size: 30))
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                            .padding(8)
                            .background(forecast.suitableForWork ? Color.green : Color.gray)
                            .clipShape(Circle())
                        Spacer(minLength: 8)
                    }
                    .frame(width: 100, height: 150)
                    .background(Color.yellow)
                    .cornerRadius(12.0)
                }
            }
        }
    }
}

//struct WeatherHourlyView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherHourlyView()
//    }
//}
