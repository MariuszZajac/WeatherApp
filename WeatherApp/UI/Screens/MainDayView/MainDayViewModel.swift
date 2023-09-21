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
        DateFormatter().string(from: weatherItem.date)
    }

    init(weatherItem: DateWeatherItem) {
        self.weatherItem = weatherItem
    }

    private func getMainWeatherItem() -> WeatherItem {
        weatherItem.items[weatherItem.items.count / 2]
    }
}
