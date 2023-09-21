//
//  DayDetailViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation

final class DayDetailViewModel: ObservableObject {

    private let weatherItem: DateWeatherItem

    var tempMax: Double {
        var maxTemp = 0.0

        weatherItem.items.forEach {
            maxTemp = max(maxTemp, $0.main.tempMax)
        }

        return maxTemp
    }

    init(weatherItem: DateWeatherItem) {
        self.weatherItem = weatherItem
    }
}
