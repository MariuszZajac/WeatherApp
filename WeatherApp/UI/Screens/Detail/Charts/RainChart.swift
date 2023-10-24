//
//  RainChart.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 24/10/2023.
//

import SwiftUI
import Charts

struct RainChart: View {
    let dailyWeatherData: [DailyWeather]
    let rainChart: [RainData]
    
    init(dailyWeatherData: [DailyWeather]) {
        self.dailyWeatherData = dailyWeatherData
        self.rainChart = dailyWeatherData.map { RainData(forecast: $0) }
    }
    
    var body: some View {
        HStack {
            Chart {
                ForEach(rainChart, id: \.date) { item in
                    
                    LineMark(x: .value("Hour", item.date),
                             y: .value("Rain ", item.rain))
                }
                .foregroundStyle(.green)
            }
        }
        .padding(8)
    }
    
}

class RainData {
    var forecast: DailyWeather
    var rain: Double {
        forecast.pop
    }
    var date: Date
    
    init(forecast: DailyWeather) {
        self.forecast = forecast
        self.date = Date(timeIntervalSince1970:forecast.dt)
    }
}


