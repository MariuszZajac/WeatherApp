//
//  WeatherDataBuilder.swift
//  WeatherAppTests
//
//  Created by Mariusz Zając on 18/10/2023.
//

import Foundation

@testable import WeatherApp

extension WeatherData {
  static func make(
    lat: Double = 22.33,
    lon: Double = 32.22,
    timezone: String = "Central europe",
    timezoneOffset: Int? = 2,
    current: CurrentWeather = .make(),
    hourly: [HourlyWeather] = .make(),
    daily: [DailyWeather] = .make()
  ) -> Self {
    return WeatherData(
      lat: lat,
      lon: lon,
      timezone: timezone,
      timezoneOffset: timezoneOffset,
      current: current,
      hourly: hourly,
      daily: daily)
  }
}
extension CurrentWeather {
  static func make(
    dt: TimeInterval = 1_696_496_400,
    sunrise: TimeInterval = 23_872_676_188,
    sunset: TimeInterval = 2_726_847_612,
    moonrise: TimeInterval = 23_826_847_612,
    moonset: TimeInterval = 23_872_847_612,
    moonPhase: Double = 0.2,
    summary: String = "something",
    temp: Double = 2.0,
    feelsLike: Double = 3.4,
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
    visibility: Int = 222,
    rain: Rain? = nil
  ) -> Self {
    return CurrentWeather(
      dt: dt,
      sunrise: sunrise,
      sunset: sunset,
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
      weather: [weather],
      rain: rain)

  }
}
extension [DailyWeather] {
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
    return [
      DailyWeather(
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
    ]
  }
}
extension [HourlyWeather] {
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
    return [
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
    ]
  }
}
