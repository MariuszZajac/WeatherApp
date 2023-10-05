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
//    var sunrise: Int {
//        currentWeather.sunrise!
//    }
//    var sunset: Int {
//        currentWeather.sunset!
//    }
    
  
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
//    var wind: Wind {
//        currentWeather.wind!}
    
    init(currentWeather: CurrentWeather) {
        self.currentWeather = currentWeather
    }
    
}
func getDayOfWeek(from date: TimeInterval) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let formattedDate = dateFormatter.string(from: Date(timeIntervalSince1970: date))
    
    dateFormatter.dateFormat = "EEE"
    return dateFormatter.string(from: dateFormatter.date(from: formattedDate)!).uppercased()
}

