//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 07/09/2023.
//

import Foundation

protocol WeatherRepositoryProtocol {
    func fetchWeatherData(latitude: Double, longitude: Double) async throws -> [WeatherData]
}

final class WeatherRepository: WeatherRepositoryProtocol {

    private let weatherAPIService: WeatherAPIServiceProtocol
    private let weatherDataCache: WeatherDataCache

    /// Inicjalizacja z Dependency Injection

    init(weatherAPIService: WeatherAPIServiceProtocol, weatherDataCache: WeatherDataCache) {
        self.weatherAPIService = weatherAPIService
        self.weatherDataCache = weatherDataCache
    }

    func fetchWeatherData(latitude: Double, longitude: Double) async throws -> [WeatherData] {

//        if cache -> return cache
//            if not cache -> return network response
//                save network to cache
            do {
                /// Pobieranie danych z API
                let response = try await weatherAPIService.downloadWeatherData(latitude: latitude, longitude: longitude)
                /// Aktualizacja danych pogodowych i zapisanie ich do pamięci podręcznej
                return response.list
            } catch {
                throw error
                /// Obsługa błędów i korzystanie z danych z pamięci podręcznej, jeśli są dostępne
//               handleError(error)
            }
    }
}
