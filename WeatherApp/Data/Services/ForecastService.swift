//
//  ForecastService.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 07/10/2023.
//

import Foundation
protocol Forecast {
    var dt: TimeInterval { get }
    var pressure: Int { get }
    var humidity: Int { get }
    var dewPoint: Double { get }
    var windSpeed: Double { get }
    var windDeg: Int { get }
    var weather: [WeatherInfo] { get }
}

//protocol ForecastService {
//    func fetchDailyForecast(completion: @escaping ([DailyWeather]?) -> Void)
//    func fetchHourlyForecast(completion: @escaping ([HourlyWeather]?) -> Void)
//    func fetchCurrentForecast(completion: @escaping (CurrentWeather?) -> Void)
//}
