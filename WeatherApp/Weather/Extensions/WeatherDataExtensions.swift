//
//  WeatherDataExtensions.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 30/08/2023.
//
import Foundation

extension Array where Element == WeatherData {
    func groupByDay() -> [String: [WeatherData]] {
        var groupedByDay: [String: [WeatherData]] = [:]

        for data in self {
            let components = data.dtTxt.split(separator: " ")
            let day = String(components.first ?? "")

            if var existingData = groupedByDay[day] {
                existingData.append(data)
                groupedByDay[day] = existingData
            } else {
                groupedByDay[day] = [data]
            }
        }
        return groupedByDay
    }
}

extension Double {
    func roundDouble() -> String {
        return String(format: "%.1f", self)
    }
}
extension String {
    func extractHourAndMinuteFromDateTime() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
extension String {
    func extractHourFromDateTime() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "HH"
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
