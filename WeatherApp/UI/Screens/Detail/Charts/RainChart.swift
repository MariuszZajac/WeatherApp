//
//  RainChart.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 24/10/2023.
//

import Charts
import SwiftUI

struct RainChart: View {
  let currentWeatherData: CurrentWeather?
  let rainChart: [RainData]

  init(currentWeatherData: CurrentWeather) {
    self.currentWeatherData = currentWeatherData
    self.rainChart = [RainData(forecast: currentWeatherData)]

  }

  var body: some View {
    HStack {
      Chart {
        ForEach(rainChart, id: \.date) { item in

          LineMark(
            x: .value("Hour", item.date),
            y: .value("Rain ", item.rain))
        }
        .foregroundStyle(.green)
      }
    }
    .padding(8)
  }

}

class RainData {
  var forecast: CurrentWeather
  var rain: Double {
    forecast.rain?.oneHour ?? 0.0
  }

  var date: Date

  init(forecast: CurrentWeather) {
    self.forecast = forecast
    self.date = Date(timeIntervalSince1970: forecast.dt)
  }
}
