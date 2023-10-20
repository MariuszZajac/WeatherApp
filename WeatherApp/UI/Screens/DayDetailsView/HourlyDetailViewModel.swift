//
//  DayDetailViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation
//MARK: Hourly Weather forecast model
final class HourlyDetailViewModel: ObservableObject {
    
    private let forecastHourly: HourlyWeather
    init(forecastHourly: HourlyWeather) {
        self.forecastHourly = forecastHourly
    }
    var temp: String {
        forecastHourly.temp.roundDouble()
    }
    
    var weatherIcon: WeatherIcon {
        forecastHourly.weather.first?.icon ?? .snowNight
    }
    var weather: String {
        forecastHourly.weather.first?.description ?? ""
    }
    
    var hour: String? {
        let dateManager = DateManager()
        return dateManager.getFormatDateTime(date: forecastHourly.dt, dateFormat: .HHmm)
    }
    
    var pop: Double {
        forecastHourly.pop * 100
    }
    
    var devpoint: String {
        forecastHourly.dewPoint.roundDouble()
    }
    var pressure: String {
        return String(forecastHourly.pressure)
        
    }
    var humidity: String {
        return String(forecastHourly.humidity)
        
    }
    
    var uvi: String {
        return String(forecastHourly.uvi)
    }
    
    var clouds: Int {
        return forecastHourly.clouds
    }
    
    var visibility: Int? {
        return forecastHourly.visibility
    }
    
    var wind: Wind {
        let speed = forecastHourly.windSpeed
        let deg = forecastHourly.windDeg
        let gust = forecastHourly.windGust
        return Wind(windSpeed: speed, windDeg: deg, windGust: gust)
    }
}

