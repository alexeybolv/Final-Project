//
//  Agronom_Widget.swift
//  Agronom Widget
//
//  Created by Alexey Bolvonovich on 12.08.21.
//

import WidgetKit
import SwiftUI

struct WeatherEntry: TimelineEntry {
    let date = Date()
    let currentForecast: WidgetWeather
}

struct Provider: TimelineProvider {

    @AppStorage("widgetWeatherData", store: UserDefaults(suiteName: "group.com.alexeybolv.agronom"))
    var widgetWeatherData: Data = Data()

    func placeholder(in context: Context) -> WeatherEntry {
        guard let currentForecast = try? JSONDecoder().decode(WidgetWeather.self, from: widgetWeatherData) else { return WeatherEntry(currentForecast: WidgetWeather(date: Date(), temperature: 0, weatherName: "", icon: nil)) }
        let entry = WeatherEntry(currentForecast: currentForecast)
        return entry
    }

    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> Void) {
        guard let currentForecast = try? JSONDecoder().decode(WidgetWeather.self, from: widgetWeatherData) else { return }
        let entry = WeatherEntry(currentForecast: currentForecast)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> Void) {
        guard let currentForecast = try? JSONDecoder().decode(WidgetWeather.self, from: widgetWeatherData) else { return }
        let entry = WeatherEntry(currentForecast: currentForecast)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct PlaceHolderView: View {

    var body: some View {
        WidgetWeatherView(weather: WidgetWeather(date: Date(), temperature: 0.0, weatherName: "", icon: nil))
    }
}

struct WidgetEntryView: View {
    let entry: Provider.Entry

    var body: some View {
        WidgetWeatherView(weather: entry.currentForecast)
    }
}

struct WidgetWeatherView: View {

    let weather: WidgetWeather

    var body: some View {
        VStack {
            Text(weather.date.formatToString("EEE, dd MMM"))
                .foregroundColor(.gray)
            Text("\(Int(weather.temperature))")
                .font(.system(size: 60.0))
                .fontWeight(.light)
                .foregroundColor(.yellow)
            Text(weather.weatherName)
                .fontWeight(.medium)
            NetworkImage(url: weather.icon)
        }
    }
}

struct NetworkImage: View {

    let url: URL?

    var body: some View {
        Group {
            if let url = url, let imageData = try? Data(contentsOf: url),
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            else {
                Image("placeholder")
            }
        }
    }
}

@main
struct AgronomWidget: Widget {
    private let kind = "Agronom_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall])
    }
}
