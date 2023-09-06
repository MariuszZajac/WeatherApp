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
    @Published var weatherDataUI: [WeatherData] = []
    var weatherData = CurrentValueSubject<[WeatherData], Error>([])
    private let weatherAPIService: WeatherAPIServiceProtocol
    private let weatherDataCache: WeatherDataCache
    private var cancellableSet: Set<AnyCancellable> = []
    /// Inicjalizacja z Dependency Injection
    init(weatherAPIService: WeatherAPIServiceProtocol, weatherDataCache: WeatherDataCache) {
        self.weatherAPIService = weatherAPIService
        self.weatherDataCache = weatherDataCache
        /// Załadowanie domyślnych danych pogodowych
        fetchWeatherData(latitude: 51.509865, longitude: -0.118092)
        weatherData
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] newData in
                self?.weatherDataUI = newData
            })
            .store(in: &cancellableSet)
    }
    func fetchWeatherData(latitude: Double, longitude: Double) {
        Task {
            do {
                /// Pobieranie danych z API
                let response = try await weatherAPIService.downloadWeatherData(latitude: latitude, longitude: longitude)
                /// Aktualizacja danych pogodowych i zapisanie ich do pamięci podręcznej
                updateWeatherData(response.list)
            } catch {
                /// Obsługa błędów i korzystanie z danych z pamięci podręcznej, jeśli są dostępne
               handleError(error)
            }
        }
    }
    private func updateWeatherData(_ data: [WeatherData]) {
        DispatchQueue.main.async {
            self.weatherData.send(data)
            self.weatherDataCache.saveWeatherData(data)
        }
    }
    private func handleError(_ error: Error) {
           DispatchQueue.main.async {
               if let weatherError = error as? WeatherError {
                   self.error = weatherError
                   if let cachedData = self.weatherDataCache.fetchWeatherData() {
                       self.weatherData.send(cachedData)
                   }
               }
           }
       }
    struct WeatherError: Error, Identifiable {
        var id: String { localizedDescription }
        var localizedDescription: String
    }
}
