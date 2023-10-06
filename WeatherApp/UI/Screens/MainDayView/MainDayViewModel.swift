////
////  MainDayViewModel.swift
////  WeatherApp
////
////  Created by Piotr Torczynski on 21/09/2023.
////
//
//import Foundation
//import Observation
//
////MARK: Current Weather forecast model
//@Observable final class MainDayViewModel {
//    
//    private let currentWeather: CurrentWeather
//
//    var weatherIcon: WeatherIcon {
//        WeatherIcon(rawValue: (currentWeather.weather.first?.icon.systemImageName)!) ?? .snowNight
//    }
//
//    var dt: String {
//        getDayOfWeek(from: currentWeather.dt) ?? "SET"
//    }
//    var sunrise: TimeInterval {
//        currentWeather.sunrise
//    }
//    var sunset: TimeInterval {
//        currentWeather.sunset
//    }
//    
//  
//    var pressure: Int {
//        currentWeather.pressure }
//    var humidity: Int {
//        currentWeather.humidity }
//   
//    var uvi: Double {
//        currentWeather.uvi }
//    var clouds: Int {
//        currentWeather.clouds}
//    var visibility: Int{
//        currentWeather.visibility }
//    var wind: Wind {
//        let speed = currentWeather.windSpeed
//        let deg = currentWeather.windDeg
//        return Wind(windSpeed: speed, windDeg: deg, windGust: 0)
//    
//    }
//    
//    init(currentWeather: CurrentWeather) {
//        self.currentWeather = currentWeather
//    }
//    
//}
//
