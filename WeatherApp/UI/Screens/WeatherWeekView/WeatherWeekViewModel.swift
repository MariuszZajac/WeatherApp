//
//  WeatherWeekViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation

final class WeatherWeekViewModel: ObservableObject {

    @Published var weatherItems: [DateWeatherItem] = []

    init(weatherItems: [DateWeatherItem]) {
        self.weatherItems = weatherItems
    }
}
