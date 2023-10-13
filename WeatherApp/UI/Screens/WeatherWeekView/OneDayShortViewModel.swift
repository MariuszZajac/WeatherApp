//
//  WeatherWeekViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation
//MARK: Weekly Weather forecast model
class OneDayShortViewModel: ObservableObject {
    
    let forecast: DailyWeather
    init(forecast: DailyWeather) {
        self.forecast = forecast
    }
    
  
    var dayOfWeek: String {
        return getDayOfWeekFromDateTime(from: forecast.dt) ?? "NUL"
    }

    var shortDayOfWeek: String {
       return getShortNamedDayFromDateTime(from: forecast.dt) ?? "NUL"
    }
    var tempMax: Double  {
        forecast.temp.max ?? 0 }
    var tempMin: Double  {
        forecast.temp.min ?? 0}
    
    var weatherIcon: WeatherIcon {
        forecast.weather.first?.icon ?? .snowNight
    }
    
    
    
}
 
