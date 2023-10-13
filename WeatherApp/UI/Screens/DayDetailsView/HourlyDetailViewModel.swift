//
//  DayDetailViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation
//MARK: Hourly Weather forecast model
final class HourlyDetailViewModel: ObservableObject {
    
    private let forecastHourly: [HourlyWeather]
    init(forecastHourly: [HourlyWeather]) {
        self.forecastHourly = forecastHourly
    }
    var temp: String {
        forecastHourly.first?.temp.roundDouble() ?? ""
    }
    
    var weatherIcon: WeatherIcon {
        forecastHourly.first?.weather.first?.icon ?? .snowNight
    }
    var weather: String {
        forecastHourly.first?.weather.first?.description ?? ""
    }

    var hour: String {
        if let timestamp = forecastHourly.first?.dt {
            return getHourFromDateTime(from: timestamp) ?? "NUL"
        } else {
            return "NUL"
        }
    }

    
    var devpoint: String {
        forecastHourly.first?.dewPoint.roundDouble() ?? ""
    }
    var pressure: String {
        if let pressureValue = forecastHourly.first?.pressure {
            return String(pressureValue)
        } else {
            return "N/A"
        }
    }
    var humidity: String {
        if let humidityValue = forecastHourly.first?.humidity {
            return String(humidityValue)
        } else {
            return "N/A"
        }
    }

    var uvi: String {
        if let uviValue = forecastHourly.first?.uvi {
            return String(uviValue)
        } else {
            return "N/A"
        }
    }

    var clouds: Int {
        return forecastHourly.first?.clouds ?? 0
    }

    var visibility: Int {
        return forecastHourly.first?.visibility ?? 0
    }

    var wind: Wind {
        let speed = forecastHourly.first?.windSpeed ?? 0.0
        let deg = forecastHourly.first?.windDeg ?? 0
        let gust = forecastHourly.first?.windGust ?? 0.0
        return Wind(windSpeed: speed, windDeg: deg, windGust: gust)
    }
}

