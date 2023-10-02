//
//  MainDayViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation
//MARK: Current Weather forecast model
final class MainDayViewModel: ObservableObject {
    
    private let currentWeatherItem: WeatherData.Current

    var weatherIcon: WeatherIcon

    var dayString: String
    var temperature: Double
    var dayOfWeek: String?

    init(weatherItem: WeatherData.Current, weatherIcon: WeatherIcon, dayString: String, temperature: Double, dayOfWeek: String? = nil) {
        self.currentWeatherItem = weatherItem
        self.weatherIcon = weatherIcon
        self.dayString = dayString
        self.temperature = temperature
        self.dayOfWeek = dayOfWeek
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
