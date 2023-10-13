//
//  WeatherWeekViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation
//MARK: Weekly Weather forecast model
class OneDayShortViewModel: ObservableObject {
    
    let forecastDaily: DailyWeather
    init(forecast: DailyWeather) {
        self.forecastDaily = forecast
    }
    var dayOfWeek: String {
        let dateManager = DateManager()
        return dateManager.getFormatDateTime(date: forecastDaily.dt, dateFormat: .MMMdd) ?? ""
    }

    var shortDayOfWeek: String {
        let dateManager = DateManager()
        return dateManager.getFormatDateTime(date: forecastDaily.dt, dateFormat: .EEE) ?? ""
    }
    var tempMax: Double  {
        forecastDaily.temp.max ?? 0 }
    var tempMin: Double  {
        forecastDaily.temp.min ?? 0}
    
    var weatherIcon: WeatherIcon {
        forecastDaily.weather.first?.icon ?? .snowNight
    }
    
    
    
}
 
