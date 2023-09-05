//
//  WeatherNoonView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 30/08/2023.
//

import SwiftUI

struct WeatherNoonView: View {
    @ObservedObject var viewModel: WeatherViewModel
    var body: some View {
        NavigationView {
            HStack {
                let groupedWeatherData = viewModel.weatherDataUI.groupByDay()
                ForEach(groupedWeatherData.keys.sorted().prefix(5), id: \.self) { dateKey in
                    let shortDate = getDayAndMonth(from: dateKey)
                    let filteredDataForNoon = getFilteredDataOrLatest(from: groupedWeatherData, for: dateKey)
                    ForEach(filteredDataForNoon, id: \.dt) { weatherData in
                        NavigationLink(destination: WeatherDetailView(weatherData: groupedWeatherData[dateKey] ?? [])) {
                            HStack(spacing: 5) {
                                WeatherRowView(data: shortDate, icon: WeatherIcon(rawValue: weatherData.weather.first?.icon ?? "") ?? .clearDay,
                                               temp: String(format: "%.0f", weatherData.main.temp_max))
                            }
                        }
                    }
                }
            }
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
    func getFilteredDataOrLatest(from groupedWeatherData: [String: [WeatherData]], for dateKey: String) -> [WeatherData] {
        var filteredData = groupedWeatherData[dateKey]?.filter { weatherData in
            if let time = weatherData.dt_txt.extractHourAndMinuteFromDateTime() {
                return time == "12:00"
            }
            return false
        } ?? []
        if filteredData.isEmpty, let availableData = groupedWeatherData[dateKey] {
            let sortedData = availableData.sorted(by: { $0.dt > $1.dt })
            if let latestData = sortedData.first {
                filteredData.append(latestData)
            }
        }
        return filteredData
    }
}
struct WeatherNoonView_Previews: PreviewProvider {
    static var previews: some View {
        let apiService = WeatherAPIService()
        let dataCache = WeatherDataCache(fileName: "weatherCache.json")
        let viewModel = WeatherViewModel(weatherAPIService: apiService, weatherDataCache: dataCache)
        return WeatherNoonView(viewModel: viewModel)
    }
}
