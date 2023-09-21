//
//  SingleHourWeatherViewModel.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 01/09/2023.
//

import Foundation

//struct WeatherHourViewModel {
//    var hour: String
//    var icon: WeatherIcon
//    var temp: Double
//    var wind: Wind
//    var visibility: Int
//    var pressure: Int
//    var humidity: Int
//
//    init(from weatherData: WeatherItem) {
//        self.hour = weatherData.dtTxt.extractOnlyHourFromDateTime() ?? "N/A"
//        self.icon = WeatherIcon(rawValue: weatherData.weather.first?.icon ?? "") ?? .clearDay
//        self.temp = weatherData.main.temp
//        self.wind = weatherData.wind
//        self.visibility = weatherData.visibility
//        self.pressure = weatherData.main.pressure
//        self.humidity = weatherData.main.humidity
//    }
//}
extension String {
    func extractOnlyHourFromDateTime() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
