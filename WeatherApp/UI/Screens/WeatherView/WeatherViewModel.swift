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
    var weatherDataUI: [WeatherData] = []
    
    private let repository: WeatherRepositoryProtocol
    
    var icon: WeatherIcon {
        weatherDataUI.first?.current.weather.first?.icon ?? .snowNight
    }
    var temp: Double {
        (weatherDataUI.first?.current.temp ?? 0)
    }
    
    /// Inicjalizacja z Dependency Injection

    init(repository: WeatherRepositoryProtocol) {
        self.repository = repository
    }

    @MainActor
    func fetchData() async {
        do {
            let data = try await repository.fetchWeatherData(latitude: 51.509865, longitude: -0.118092)
            weatherDataUI = data
            
        } catch {
            if let weatherError = error as? WeatherError {
                self.error = weatherError
            }
        }
    }
}
