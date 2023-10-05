//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import Foundation


struct WeatherData: Codable , Identifiable {
    var id: UUID?
    let lat: Double
    let lon: Double
    let timezone: String
    let timezoneOffset: Int?
    let current: CurrentWeather
    let hourly: [HourlyWeather]
    let daily: [DailyWeather]
    
    enum CodingKeys: String, CodingKey {
        
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, hourly, daily
    }
    
}
struct CurrentWeather: Codable, Identifiable {
    var id: UUID?
    let dt: TimeInterval
    let sunrise: TimeInterval
    let sunset: TimeInterval
    let temp: Double
    let feelsLike: Double?
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [WeatherInfo]
    
    
}


struct HourlyWeather: Codable, Identifiable {
    var id: UUID?
    let dt: TimeInterval
    let temp: Double
    let feelsLike: Double?
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let weather: [WeatherInfo]
    let pop: Int
    
    
}

struct DailyWeather: Codable, Identifiable {
    var id: UUID?
    let dt: TimeInterval
    let sunrise: TimeInterval
    let sunset: TimeInterval
    let moonrise: TimeInterval
    let moonset: TimeInterval
    let moonPhase: Double
    let summary: String
    let temp: Temperature
    let feelsLike: Temperature
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let weather: [WeatherInfo]
    let clouds: Int
    let pop: Int
    let uvi: Double
    
    struct Temperature: Codable, Identifiable {
        var id: Int?
        let day: Double
        let min: Double?
        let max: Double?
        let night: Double
        let eve: Double
        let morn: Double
    }
   
}

struct WeatherInfo: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: WeatherIcon
    
}

struct Rain: Codable {
    let oneHour: Double
}

struct Temperature: Codable, Identifiable {
    var id: Int
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
}


struct Wind: Codable {
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double
}
enum WeatherIcon: String, Codable {
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
