//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import Foundation
public struct WeatherResponse: Codable, Identifiable {
    public var id: Int?
    let cod: String
    let message: Int
    let cnt: Int
    let list: [WeatherData]
}

struct WeatherData: Codable, Identifiable {
    public var id: Int?
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let sys: Sys
    let dt_txt: String
    
    struct Main: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Int
        let sea_level: Int
        let grnd_level: Int
        let humidity: Int
        let temp_kf: Double
    }
    
    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    
    struct Clouds: Codable {
        let all: Int
    }
    
    struct Wind: Codable {
        let speed: Double
        let deg: Int
        let gust: Double
    }
    
    struct Sys: Codable {
        let pod: String
    }
    
    
}



enum WeatherIcon: String {
    case clearDay = "01d"
    case clearNight = "01n"
    case fewCloudsDay = "02d"
    case fewCloudsNight = "02n"
    case scatteredCloudsDay = "03d"
    case scatteredCloudsNight = "03n"
    case brokenClouds = "04d"
    case brokenCloudsNight = "04n"
    case showerRainDay = "09d"
    case showerRainNight = "09n"
    case lightRainDay = "10d"
    case lightRainNight = "10n"
    case thunderstormDay = "11d"
    case thunderstormNight = "11n"
    case snowDay = "13d"
    case snowNight = "13n"
    case mistDay = "50d"
    case mistNight = "50n"
    
    var systemImageName: String {
        switch self {
        case .clearDay:
            return "sun.max.fill"
        case .clearNight:
            return "moon.fill"
        case .fewCloudsDay, .scatteredCloudsDay:
            return "cloud.sun.fill"
        case .fewCloudsNight, .scatteredCloudsNight:
            return "cloud.moon.fill"
        case .brokenClouds, .brokenCloudsNight:
            return "cloud.fill"
        case .showerRainDay, .showerRainNight, .lightRainDay, .lightRainNight:
            return "cloud.rain.fill"
        case .thunderstormDay, .thunderstormNight:
            return "cloud.bolt.rain.fill"
        case .snowDay, .snowNight:
            return "cloud.snow.fill"
        case .mistDay, .mistNight:
            return "cloud.fog.fill"
        }
    }
}
