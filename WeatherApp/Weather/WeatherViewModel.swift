//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import Foundation
import Combine


protocol WeatherViewModelProtocol {
    var weatherData: CurrentValueSubject<[WeatherData], Error> { get }
    func fetchWeatherData(latitude: Double, longitude: Double)
}

final class WeatherViewModel: WeatherViewModelProtocol, ObservableObject {
    @Published var error: WeatherError?
    var weatherData = CurrentValueSubject<[WeatherData], Error>([])
    private let weatherAPIService: WeatherAPIServiceProtocol
    private let weatherDataCache: WeatherDataCache
    private var cancellableSet: Set<AnyCancellable> = []
    
    // Inicjalizacja z Dependency Injection
    init(weatherAPIService: WeatherAPIServiceProtocol, weatherDataCache: WeatherDataCache) {
        self.weatherAPIService = weatherAPIService
        self.weatherDataCache = weatherDataCache
    }
    
    func fetchWeatherData(latitude: Double, longitude: Double) {
        Task {
            do {
                let response = try await weatherAPIService.downloadWeatherData(latitude: latitude, longitude: longitude)
                DispatchQueue.main.async {
                    self.weatherData.send(response.list)
                    self.weatherDataCache.saveWeatherData(response.list)
                }
            } catch {
                if let weatherError = error as? WeatherError {
                    DispatchQueue.main.async {
                        self.error = weatherError
                        
                        if let cachedData = self.weatherDataCache.fetchWeatherData() {
                            self.weatherData.send(cachedData)
                        }
                    }
                }
            }
        }
    }

    struct WeatherError: Error, Identifiable {
        var id: String { localizedDescription }
        var localizedDescription: String
    }
    
}

