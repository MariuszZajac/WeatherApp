//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import Foundation
import SwiftUI

final class WeatherViewModel: ObservableObject {
    var error: WeatherError?
    private var forecast: WeatherData?
    @Published var dayForecast: [DailyWeather] = []
    @Published var hourlyForecast: [HourlyWeather] = []
    @Published var currentForecast: CurrentWeather?
    
    private let repository: WeatherRepositoryProtocol
    
    //private let forecastService: ForecastService
    
    init( repository: WeatherRepositoryProtocol ){//, forecastService: ForecastService) {
        //  self.forecastService = forecastService
        self.repository = repository
    }
    
    
    
    
    var icon: WeatherIcon {
        currentForecast?.weather.first?.icon ?? .snowNight
    }
    var temp: Double {
        (currentForecast?.temp ?? 0.0)
    }
    var description: String {
        currentForecast?.weather.first?.description ?? ""
    }
    
    var wind: Wind {
        let speed = forecast?.current.windSpeed ?? 0
        let deg = forecast?.current.windDeg ?? 0
        let gust = 0.0
        return Wind(windSpeed: speed, windDeg: deg, windGust: gust)
        
    }
    
    @MainActor
    func fetchData() async {
        do {
            
            let data = try await repository.fetchWeatherData (latitude: 51.509865, longitude: -0.118092)//(latitude: 34.10922415570355, longitude: -117.33337910717069)// (latitude: 25.78008308243522,longitude: -80.25658171671407)// (latitude: 51.8300, longitude:  22.9890)
            //(latitude: 51.509865, longitude: -0.118092) paris
            // (latitude: 25.78008308243522,longitude:   -80.25658171671407)
            
            //forecast = data
            dayForecast = data.daily
            hourlyForecast = data.hourly
            currentForecast = data.current
        } catch {
            if let weatherError = error as? WeatherError {
                self.error = weatherError
            }
        }
    }
  
    func getHourlyForecast(for item: DailyWeather) -> [HourlyWeather] {
        
        let targetDate = Date(timeIntervalSince1970: item.dt)
        
        let hourlyWeatherForDate = hourlyForecast.filter { hourly in
            let hourlyDate = Date(timeIntervalSince1970: hourly.dt)
            return Calendar.current.isDate(hourlyDate, inSameDayAs: targetDate)
        }
        
        return hourlyWeatherForDate
    }


    
    

}

