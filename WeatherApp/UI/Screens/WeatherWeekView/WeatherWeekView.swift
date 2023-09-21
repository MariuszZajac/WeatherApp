//
//  WeatherNoonView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 30/08/2023.
//

import SwiftUI

struct WeatherWeekView: View {
    @ObservedObject var viewModel: WeatherWeekViewModel

    var body: some View {
        NavigationStack {
            Text("")
        }
    }
    func getDayAndMonth(from fullDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        if let date = dateFormatter.date(from: fullDate) {
            dateFormatter.dateFormat = "MMM dd"
            return dateFormatter.string(from: date)
        }
        return "Invalid Date"
    }
}
//    func getFilteredDataOrLatest(from groupedWeatherData: [String: [WeatherData]], for dateKey: String) -> [WeatherData] {
//        var filteredData = groupedWeatherData[dateKey]?.filter { weatherData in
//            if let time = weatherData.dtTxt.extractHourAndMinuteFromDateTime() {
//                return time == "12:00"
//            }
//            return false
//        } ?? []
//        if filteredData.isEmpty, let availableData = groupedWeatherData[dateKey] {
//            let sortedData = availableData.sorted(by: { $0.dt > $1.dt })
//            if let latestData = sortedData.first {
//                filteredData.append(latestData)
//            }
//        }
//        return filteredData
//    }

// struct WeatherNoonView_Previews: PreviewProvider {
//    static var previews: some View {
//        let apiService = WeatherAPIService()
//        let dataCache = WeatherDataCache(fileName: "weatherCache.json")
//        let viewModel = WeatherViewModel(weatherAPIService: apiService, weatherDataCache: dataCache)
//        return WeatherNoonView(viewModel: viewModel)
//    }
// }
