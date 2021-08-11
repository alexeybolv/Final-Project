//
//  WeatherDailyView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 25.07.21.
//

import SwiftUI

import SDWebImageSwiftUI
import WeatherAPI

struct WeatherDailyView: View {
    @State var data: DailyForecast

    var body: some View {
        VStack {
            HStack {
                WebImage(url: data.weather?.icon)
                Text(data.date.formatToString("EEEE"))
                    .fontWeight(.medium)
                    .font(.system(size: 16.0))
            }
        }
        .background(Color.blue)
    }
}

//struct WeatherListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherListItem(data: DailyForecast())
//    }
//}
