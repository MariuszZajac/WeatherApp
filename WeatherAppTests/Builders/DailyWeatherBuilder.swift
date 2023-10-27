//
//  DailyWeatherBuilder.swift
//  WeatherAppTests
//
//  Created by Mariusz Zając on 13/10/2023.
//

import Foundation

@testable import WeatherApp

extension DailyWeather {
  static func make(
    dt: TimeInterval = 1_696_496_400,
    sunrise: TimeInterval = 23_872_676_188,
    sunset: TimeInterval = 2_726_847_612,
    moonrise: TimeInterval = 23_826_847_612,
    moonset: TimeInterval = 23_872_847_612,
    moonPhase: Double = 0.2,
    summary: String = "something",
    temp: Temperature = .make(),
    feelsLike: Temperature = .make(),
    pressure: Int = 999,
    humidity: Int = 33,
    dewPoint: Double = 22.3,
    windSpeed: Double = 33.2,
    windDeg: Int = 33,
    windGust: Double = 33.2,
    weather: WeatherInfo = .make(),
    clouds: Int = 22,
    pop: Double = 3.4,
    uvi: Double = 2,
    visibility: Int = 222
  ) -> Self {
    return DailyWeather(
      dt: dt,
      sunrise: sunrise,
      sunset: sunset,
      moonrise: moonrise,
      moonset: moonset,
      moonPhase: moonPhase,
      summary: summary,
      temp: temp,
      feelsLike: feelsLike,
      pressure: pressure,
      humidity: humidity,
      dewPoint: dewPoint,
      windSpeed: windSpeed,
      windDeg: windDeg,
      windGust: windGust,
      weather: [weather],
      clouds: clouds,
      pop: pop,
      uvi: uvi,
      visibility: visibility)
  }
}
extension WeatherInfo {
  static func make(
    id: Int = 100, main: String = "ellsasdkaod", description: String = "nithing",
    icon: WeatherIcon = .brokenClouds
  ) -> Self {
    return WeatherInfo(id: id, main: main, description: description, icon: icon)
  }
}
extension WeatherIcon {
  static func make(rawValue: String = "clouds") -> Self {
    return WeatherIcon(rawValue: rawValue)!
  }
}
extension Temperature {
  static func make(
    day: Double = 33.4, min: Double? = 12, max: Double? = 22, night: Double = 33.6,
    eve: Double = 32.1, morn: Double = 9.0
  ) -> Self {
    return Temperature(day: day, min: min, max: max, night: night, eve: eve, morn: morn)
  }
}
extension Rain {
  static func make(oneHour: Double?) -> Self? {
    guard let oneHourValue = oneHour else {
      return nil
    }
    return Rain(oneHour: oneHourValue)
  }
}
