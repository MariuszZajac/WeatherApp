//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import Foundation
import SwiftData

@Observable final class WeatherViewModel {
    var error: WeatherError?
    var forecast: [WeatherData] = []
    
    
    private let repository: WeatherRepositoryProtocol
    
    var icon: WeatherIcon {
        forecast.first?.current.weather.first?.icon ?? .snowNight
    }
    var temp: Double {
        (forecast.first?.current.temp ?? 0)
    }
    var description: String {
        forecast.first?.current.weather.first?.description ?? ""
    }
    
    var wind: Wind {
        let speed = forecast.first?.current.windSpeed ?? 0
        let deg = forecast.first?.current.windDeg ?? 0
        let gust = 0.0
    return Wind(windSpeed: speed, windDeg: deg, windGust: gust)

}
    /// Inicjalizacja z Dependency Injection

    init(repository: WeatherRepositoryProtocol) {
        self.repository = repository
    }

    @MainActor
    func fetchData() async {
        do {
        
            let data = try await repository.fetchWeatherData(latitude: 34.10922415570355, longitude: -117.33337910717069)// (latitude: 25.78008308243522,longitude: -80.25658171671407)// (latitude: 51.8300, longitude:  22.9890)
            //(latitude: 51.509865, longitude: -0.118092) paris
            // (latitude: 25.78008308243522,longitude:   -80.25658171671407)

            forecast = data
            
        } catch {
            if let weatherError = error as? WeatherError {
                self.error = weatherError
            }
        }
    }
}

protocol WeatherForecastProvider {
    
    func getForecast() -> [Any]
}

