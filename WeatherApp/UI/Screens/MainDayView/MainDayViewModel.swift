//
//  MainDayViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation
import Observation

//MARK: Current Weather forecast model
@Observable final class MainDayViewModel {
    
    private let currentWeather: CurrentWeather

    var weatherIcon: WeatherIcon {
        WeatherIcon(rawValue: (currentWeather.weather.first?.icon.systemImageName)!) ?? .snowNight
    }

    var dt: String {
        getDayOfWeek(from: currentWeather.dt) ?? "SET"
    }
    var sunrise: TimeInterval {
        currentWeather.sunrise
    }
    var sunset: TimeInterval {
        currentWeather.sunset
    }
    
  
    var pressure: Int {
        currentWeather.pressure }
    var humidity: Int {
        currentWeather.humidity }
   
    var uvi: Double {
        currentWeather.uvi }
    var clouds: Int {
        currentWeather.clouds}
    var visibility: Int{
        currentWeather.visibility }
    var wind: Wind {
        let speed = currentWeather.windSpeed
        let deg = currentWeather.windDeg
        return Wind(windSpeed: speed, windDeg: deg, windGust: 0)
    
    }
    
    init(currentWeather: CurrentWeather) {
        self.currentWeather = currentWeather
    }
    
}
func getDayOfWeek(from date: TimeInterval) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd"
    let formattedDate = dateFormatter.string(from: Date(timeIntervalSince1970: date))
    
    if let dateFromFormatted = dateFormatter.date(from: formattedDate) {
            return dateFormatter.string(from: dateFromFormatted)
        } else {
            return nil
        }
}
 func getShortNamedDay(from date: TimeInterval) -> String? {
     let dateFormatter = DateFormatter()
     dateFormatter.dateFormat = "EEE"
     let formattedDate = dateFormatter.string(from: Date(timeIntervalSince1970: date))
     
     if let dateFromFormatted = dateFormatter.date(from: formattedDate) {
             return dateFormatter.string(from: dateFromFormatted).uppercased()
         } else {
             return nil
         }
 }

