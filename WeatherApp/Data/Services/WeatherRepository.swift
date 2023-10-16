//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 07/09/2023.
//

import Foundation

protocol WeatherRepositoryProtocol {
    func fetchWeatherData(latitude: Double, longitude: Double) async throws -> WeatherData
}

final class WeatherRepository: WeatherRepositoryProtocol {

    private let weatherAPIService: WeatherAPIServiceProtocol
    private let weatherDataCache: WeatherDataCache

    init(weatherAPIService: WeatherAPIServiceProtocol, weatherDataCache: WeatherDataCache) {
        self.weatherAPIService = weatherAPIService
        self.weatherDataCache = weatherDataCache
        
    }

    func fetchWeatherData(latitude: Double, longitude: Double) async throws -> WeatherData {
        do {
            if weatherDataCache.isCacheFresh(), let data = weatherDataCache.fetchWeatherData()  {
                return data
               
            } else {
                let response = try await weatherAPIService.downloadWeatherData(latitude: latitude, longitude: longitude)
                weatherDataCache.saveWeatherData(response)
                return response
            }
        } catch {
            throw error
        }
    }

  
}
