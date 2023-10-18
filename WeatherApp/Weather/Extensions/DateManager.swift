//
//  DateManager.swift
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

class DateManager {
    
    private let dateFormatter = DateFormatter()
    
    func getFormatDateTime(date: TimeInterval, dateFormat: DateFormat) -> String? {
        dateFormatter.dateFormat = dateFormat.rawValue
        let formattedDate = dateFormatter.string(from: Date(timeIntervalSince1970: date))
        
        if let dateFromFormatted = dateFormatter.date(from: formattedDate) {
            return dateFormatter.string(from: dateFromFormatted)
        } else {
            return nil
        }
    }
    
}


