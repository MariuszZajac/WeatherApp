//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import Foundation
import Combine

// Protokół dla WeatherViewModel
protocol WeatherViewModelProtocol {
    var weatherData: CurrentValueSubject<[WeatherData], Never> { get }
    func fetchWeatherData(latitude: Double, longitude: Double)
}

final class WeatherViewModel: WeatherViewModelProtocol, ObservableObject {
    @Published var error: WeatherError?

    var weatherData = CurrentValueSubject<[WeatherData], Never>([])
    private let weatherAPIService: WeatherAPIServiceProtocol
    private var cancellableSet: Set<AnyCancellable> = []

    // Inicjalizacja z Dependency Injection
    init(weatherAPIService: WeatherAPIServiceProtocol) {
        self.weatherAPIService = weatherAPIService
    }

    // Pobranie danych o pogodzie
    func fetchWeatherData(latitude: Double, longitude: Double) {
        Task {
            do {
                let response = try await weatherAPIService.downloadWeatherData(latitude: latitude, longitude: longitude)
                self.weatherData.send(response.list)
            } catch {
                if let weatherError = error as? WeatherError {
                               self.error = weatherError
                           }
            }
        }
    }
}

