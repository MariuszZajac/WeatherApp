//
//  MainDayViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation

final class MainDayViewModel: ObservableObject {
    private let weatherItem: DateWeatherItem

    var weatherIcon: WeatherIcon {
        guard let description = getMainWeatherItem().weather.first?.icon else {
            return WeatherIcon.brokenClouds
        }
        return WeatherIcon(rawValue: description) ?? .brokenClouds
    }

    var dayString: String {
        let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd"
            return formatter.string(from: weatherItem.date)
    }
    var temperature: Double {
        weatherItem.items.first?.main.tempMax ?? 0 
    }
    var dayOfWeek: String? {
        getDayOfWeek(from: weatherItem.date)
    }

    init(weatherItem: DateWeatherItem) {
        self.weatherItem = weatherItem
    }

    private func getMainWeatherItem() -> WeatherItem {
        weatherItem.items[weatherItem.items.count / 2]
    }
}
func getDayOfWeek(from date: Date) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd"
    guard let date = dateFormatter.date(from: dateFormatter.string(from: date)) else {
        return nil
    }
    dateFormatter.dateFormat = "EEE"
    return dateFormatter.string(from: date).uppercased()
}
