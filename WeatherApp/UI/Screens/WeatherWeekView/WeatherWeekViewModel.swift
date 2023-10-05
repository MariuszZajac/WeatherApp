//
//  WeatherWeekViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation
//MARK: Weekly Weather forecast model
final class WeatherWeekViewModel: ObservableObject {

    @Published var weekWeather: DailyWeather
    var day: String {
        weekWeather.dt.formatted()
    }
    var dayOfWeek: String {
        getDayOfWeek(from: weekWeather.dt) ?? "NUL"
    }
    var tempMax: Double  {
        weekWeather.temp.max ?? 0 }
    var tempMin: Double  {
        weekWeather.temp.min ?? 0}
    
    var weatherIcon: WeatherIcon {
        WeatherIcon(rawValue: (weekWeather.weather.first?.icon.systemImageName)!) ?? .snowNight
    }
    
    init(weekWeatherItem: DailyWeather) {
        self.weekWeather = weekWeatherItem
    }
    
     
}
