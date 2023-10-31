//
//  HourlyWeatherBuilder.swift
//  WeatherAppTests
//
//  Created by Mariusz Zając on 30/10/2023.
//

import Foundation

@testable import WeatherApp
extension HourlyWeather {
  static func make(
    dt: TimeInterval = 1_696_496_400,
    temp: Double = 0.0,
    feelsLike: Double? = 3.0,
    pressure: Int = 999,
    humidity: Int = 33,
    dewPoint: Double = 22.3,
    uvi: Double = 2,
    clouds: Int = 22,
    visibility: Int? = nil,
    windSpeed: Double = 33.2,
    windDeg: Int = 33,
    windGust: Double = 33.2,
    weather: WeatherInfo = .make(),
    pop: Double = 3.4
  ) -> Self {
    return
      HourlyWeather(
        dt: dt,
        temp: temp,
        feelsLike: feelsLike,
        pressure: pressure,
        humidity: humidity,
        dewPoint: dewPoint,
        uvi: uvi,
        clouds: clouds,
        visibility: visibility,
        windSpeed: windSpeed,
        windDeg: windDeg,
        windGust: windGust,
        weather: [weather],
        pop: pop)
    
  }
}
