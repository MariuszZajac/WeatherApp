//
//  WeatherWeekViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation

//MARK: Weekly Weather forecast model
class OneDayShortViewModel: ObservableObject {

  private let forecastDaily: DailyWeather
  private let dateManager = DateManager()
  init(forecast: DailyWeather) {
    self.forecastDaily = forecast
  }
  var dayOfWeek: String {
    return dateManager.getFormatDateTime(date: forecastDaily.dt, dateFormat: .MMMdd) ?? ""
  }
  var shortDayOfWeek: String {
    return dateManager.getFormatDateTime(date: forecastDaily.dt, dateFormat: .EEE) ?? ""
  }
  var tempMax: Double {
    forecastDaily.temp.max ?? 0
  }
  var tempMin: Double {
    forecastDaily.temp.min ?? 0
  }
  var weatherIcon: WeatherIcon {
    forecastDaily.weather.first?.icon ?? .snowNight
  }
  var pop: Double {
    forecastDaily.pop * 100
  }

}
