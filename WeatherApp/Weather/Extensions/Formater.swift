//
//  WeatherDataExtensions.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 30/08/2023.
//
import Foundation
enum DateFormat: String {
    case HHmm = "HH:mm"
    case MMMdd = "MMM dd"
    case EEE = "EEE"
}

class Formater {
   
    func getFromDateTime(from date: TimeInterval, dateFormat: DateFormat.RawValue) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let formattedDate = dateFormatter.string(from: Date(timeIntervalSince1970: date))
        
        if let dateFromFormatted = dateFormatter.date(from: formattedDate) {
            return dateFormatter.string(from: dateFromFormatted)
        } else {
            return nil
        }
    }
    
    
    func getHourFromDateTime(from date: TimeInterval) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let formattedDate = dateFormatter.string(from: Date(timeIntervalSince1970: date))
        
        if let dateFromFormatted = dateFormatter.date(from: formattedDate) {
            return dateFormatter.string(from: dateFromFormatted)
        } else {
            return nil
        }
    }
    
    func getDayOfWeekFromDateTime(from date: TimeInterval) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        let formattedDate = dateFormatter.string(from: Date(timeIntervalSince1970: date))
        
        if let dateFromFormatted = dateFormatter.date(from: formattedDate) {
            return dateFormatter.string(from: dateFromFormatted)
        } else {
            return nil
        }
    }
    func getShortNamedDayFromDateTime(from date: TimeInterval) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        let formattedDate = dateFormatter.string(from: Date(timeIntervalSince1970: date))
        
        if let dateFromFormatted = dateFormatter.date(from: formattedDate) {
            return dateFormatter.string(from: dateFromFormatted).uppercased()
        } else {
            return nil
        }
    }
}
extension Double {
    func roundDouble() -> String {
        return String(format: "%.1f", self)
    }
}
