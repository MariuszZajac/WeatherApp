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
