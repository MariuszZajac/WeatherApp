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
        
        HStack{
            let groupedWeatherData = viewModel.weatherDataUI.groupByDay()
            
            ForEach(groupedWeatherData.keys.sorted().prefix(5), id: \.self) { dateKey in
                let shortDate = getDayAndMonth(from: dateKey)
                Section(header: Text(shortDate)
                    .bold()
                    .font(.headline)) {
                        
                        // Filtruj dane, aby pokazać tylko te dla godziny 12:00
                        let filteredDataForNoon = groupedWeatherData[dateKey]?.filter { weatherData in
                            if let time = weatherData.dt_txt.extractHourAndMinuteFromDateTime() {
                                return time == "12:00"
                            }
                            return false
                        } ?? []
                        
                        ForEach(filteredDataForNoon, id: \.dt) { weatherData in
                            
                            VStack(alignment: .leading, spacing: 15){
                                HStack{ WeatherRowView2( icon:"wind", fullDate:"Mon", temp: "\(weatherData.main.temp_max)°")
                                }
                                
                            }
                            .frame(width: 2000, height: 150)
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
        return "Invalid Date"    }

}




struct WeatherNoonView_Previews: PreviewProvider {
    static var previews: some View {
        let apiService = WeatherAPIService()
        let dataCache = WeatherDataCache(fileName: "weatherCache.json")
        let viewModel = WeatherViewModel(weatherAPIService: apiService, weatherDataCache: dataCache)
        
        return WeatherNoonView(viewModel: viewModel)
    }
}
