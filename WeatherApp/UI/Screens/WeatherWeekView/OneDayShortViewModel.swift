//
//  WeatherWeekViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation
//MARK: Weekly Weather forecast model
struct OneDayShortViewModel {
    var forecast: [WeatherData]
  //  var forecast: DailyWeather
    
  
    var dayOfWeek: String {
        let timestamp = forecast.first?.daily.first?.dt ?? 0
        return getDayOfWeek(from: timestamp) ?? "NUL"
    }

    var shortDayOfWeek: String {
        let timestamp = forecast.first?.daily.first?.dt ?? 0
       return getShortNamedDay(from: timestamp) ?? "NUL"
    }
    var tempMax: Double  {
        forecast.first?.daily.first?.temp.max ?? 0 }
    var tempMin: Double  {
        forecast.first?.daily.first?.temp.min ?? 0}
    
    var weatherIcon: WeatherIcon {
        forecast.first?.daily.first?.weather.first?.icon ?? .snowNight
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
