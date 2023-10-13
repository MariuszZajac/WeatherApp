//
//  TemperatureGraph.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 14/09/2023.
//

import SwiftUI
import Charts

struct TemperatureChart: View {
    let hourlyWeatherData: [HourlyWeather]
       let temperatureChart: [TemperatureData]
       
       init(hourlyWeatherData: [HourlyWeather]) {
           self.hourlyWeatherData = hourlyWeatherData
           self.temperatureChart = hourlyWeatherData.map { TemperatureData(forecast: $0, temp: $0.temp) }
       }
    
    var body: some View {
        HStack {
            Chart {
                ForEach(temperatureChart, id: \.date) { item in
                    
                    LineMark(x: .value("Hour", item.date),
                             y: .value("Temperatura", item.temp))
                }
                .foregroundStyle(.green)
            }
        }
        .padding(8)
    }
    
}

class TemperatureData {
    var forecast: HourlyWeather
    var temp: Double
    var date: Date
    
    init(forecast: HourlyWeather, temp: Double) {
        self.forecast = forecast
        self.temp = forecast.temp
        self.date = Date(timeIntervalSince1970:forecast.dt)
    }
}


