////
////  WeatherData.swift
////  WeatherApp
////
////  Created by Mariusz Zając on 18/09/2023.
////
//
//import SwiftUI
//import Observation
//
//@Observable class WeatherData2 {
//     var dt: Int
//     var main: Main
//     var weather: [Weather]
//     var clouds: Clouds
//     var wind: Wind
//     var visibility: Int
//     var dtTxt: String
//    init(dt: Int, main: Main, weather: [Weather], clouds: Clouds, wind: Wind, visibility: Int, dtTxt: String) {
//        self.dt = dt
//        self.main = main
//        self.weather = weather
//        self.clouds = clouds
//        self.wind = wind
//        self.visibility = visibility
//        self.dtTxt = dtTxt
//    }
//}
//class Main: Codable {
//    let temp: Double
//    let feelsLike: Double
//    let tempMin: Double
//    let tempMax: Double
//    let pressure: Int
//    let seaLevel: Int
//    let groundLevel: Int
//    let humidity: Int
//    let tempKf: Double
//}
//struct Weather: Codable {
//    let id: Int
//    let main: String
//    let description: String
//    let icon: String
//}
//struct Clouds: Codable {
//    let all: Int
//}
//struct Wind: Codable {
//    let speed: Double
//    let deg: Int
//    let gust: Double
//}
