//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//
import Foundation
import SwiftUI
import Combine

struct WeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Paris")
                    .bold()
                    .font(.largeTitle)
                
                Text("\(Date().formatted(.dateTime.month().day().hour().minute()))")
                    .fontWeight(.bold)
                
                List {
                    let groupedWeatherData = viewModel.weatherDataUI.groupByDay()
                    
                    ForEach(groupedWeatherData.keys.sorted(), id: \.self) { dateKey in
                        Section(header: Text(dateKey)) {
                            
                            let filteredDataForNoon = groupedWeatherData[dateKey]?.filter { weatherData in
                                if let time = weatherData.dt_txt.extractHourAndMinuteFromDateTime() {
                                    return time == "12:00"
                                }
                                return false
                            } ?? []
                            
                            ForEach(filteredDataForNoon, id: \.dt) { weatherData in
                                VStack{
                                    VStack(alignment: .leading, spacing: 5) {
                                        
                                        Text("\(weatherData.main.temp.roundDouble())°")
                                            .font(.largeTitle)
                                            .bold()
                                        if let time = weatherData.dt_txt.extractHourAndMinuteFromDateTime() {
                                            Text("\(time)")
                                        }

                                        Text("Odczuwalna temperatura: \(weatherData.main.feels_like.roundDouble())°C")
                                        Text("Ciśnienie: \(weatherData.main.pressure) hPa")
                                        Text("Wilgotność: \(weatherData.main.humidity)%")
                                        Text("Wiatr: \(weatherData.wind.speed.roundDouble()) m/s")
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                }
                                
                            }
                            
                        }
                    }
                }
            }
            .background(Color.blue)
    
            
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        let apiService = WeatherAPIService()
        let dataCache = WeatherDataCache(fileName: "weatherCache.json")
        let viewModel = WeatherViewModel(weatherAPIService: apiService, weatherDataCache: dataCache)
        
        return WeatherView(viewModel: viewModel)
    }
}


