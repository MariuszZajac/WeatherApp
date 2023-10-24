//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import Foundation
import SwiftUI

final class WeatherViewModel: ObservableObject {
    enum ForecastType: Int {
        case hour = 0
        case week
    }
    enum State {
        case loading, error(String), loaded
    }
    
    @Published var state: State = .loaded
    @Published var dayForecast: [DailyWeather] = []
    @Published var hourlyForecast: [HourlyWeather] = []
    @Published var currentForecast: CurrentWeather?
    @Published var selectedForecastType: ForecastType = .hour
    
    private let repository: WeatherRepositoryProtocol
    private var forecast: WeatherData?
  
    
    init( repository: WeatherRepositoryProtocol ){
        self.repository = repository
    }
    var error: WeatherError?
    
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
        let speed = currentForecast?.windSpeed ?? 0
        let deg = currentForecast?.windDeg ?? 0
        let gust = 0.0
        return Wind(windSpeed: speed, windDeg: deg, windGust: gust)
        
    }
    
    func refreshData() {
       //TODO: figure out how refresh or update data. 
    }

    @MainActor
    func fetchData(latitude: Double,longitude: Double ) async {
        state = .loading
        do {
            
            let data = try await repository.fetchWeatherData(latitude: latitude, longitude: longitude)
            print(latitude)
            print(longitude)
            dayForecast = data.daily
            hourlyForecast = data.hourly
            currentForecast = data.current
            state = .loaded
        } catch {
            if let weatherError = error as? WeatherError {
                self.error = weatherError
                state = .error(error.localizedDescription)
               
            }
        }
    }
 }

