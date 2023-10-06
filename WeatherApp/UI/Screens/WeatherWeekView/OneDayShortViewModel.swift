//
//  WeatherWeekViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation
//MARK: Weekly Weather forecast model
final class OneDayShortViewModel: ObservableObject {

    var weekWeather: DailyWeather
    
  
    var dayOfWeek: String {
        getDayOfWeek(from: weekWeather.dt) ?? "NUL"
    }
    var shortDayOfWeek: String {
        getShortNamedDay(from: weekWeather.dt) ?? "NUL"
    }
    var tempMax: Double  {
        weekWeather.temp.max ?? 0 }
    var tempMin: Double  {
        weekWeather.temp.min ?? 0}
    
    var weatherIcon: WeatherIcon {
        weekWeather.weather.first?.icon ?? .snowNight
    }
    
    init(weekWeather: DailyWeather) {
        self.weekWeather = weekWeather
    } 
}
func getDayOfWeek(from date: TimeInterval) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd"
    let formattedDate = dateFormatter.string(from: Date(timeIntervalSince1970: date))
    
    if let dateFromFormatted = dateFormatter.date(from: formattedDate) {
            return dateFormatter.string(from: dateFromFormatted)
        } else {
            return nil
        }
}
 func getShortNamedDay(from date: TimeInterval) -> String? {
     let dateFormatter = DateFormatter()
     dateFormatter.dateFormat = "EEE"
     let formattedDate = dateFormatter.string(from: Date(timeIntervalSince1970: date))
     
     if let dateFromFormatted = dateFormatter.date(from: formattedDate) {
             return dateFormatter.string(from: dateFromFormatted).uppercased()
         } else {
             return nil
         }
 }
