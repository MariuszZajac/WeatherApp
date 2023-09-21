//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 07/09/2023.
//

import Foundation

protocol WeatherRepositoryProtocol {
    func fetchWeatherData(latitude: Double, longitude: Double) async throws -> [DateWeatherItem]
}

final class WeatherRepository: WeatherRepositoryProtocol {

    private let weatherAPIService: WeatherAPIServiceProtocol
    private let weatherDataCache: WeatherDataCache

    init(weatherAPIService: WeatherAPIServiceProtocol, weatherDataCache: WeatherDataCache) {
        self.weatherAPIService = weatherAPIService
        self.weatherDataCache = weatherDataCache
    }

    func fetchWeatherData(latitude: Double, longitude: Double) async throws -> [DateWeatherItem] {
        do {
            if weatherDataCache.isCacheFresh() {
                let dto = weatherDataCache.fetchWeatherData()!
                return prepareData(dto: dto)
            } else {
                let response = try await weatherAPIService.downloadWeatherData(latitude: latitude, longitude: longitude)
                weatherDataCache.saveWeatherData(response.list)
                return prepareData(dto: response.list)
            }
        } catch {
            throw error
        }
    }

    private func prepareData(dto: [WeatherDataDTO]) -> [DateWeatherItem] {
        let calendar = Calendar.current

        let initial: [Date: [WeatherItem]] = [:]

        let groupedByDateComponents = dto.reduce(into: initial) { acc, cur in
            let timestampDate = Date(timeIntervalSince1970: cur.dt)
            let components = calendar.dateComponents([.day, .month, .year], from: timestampDate)
            let date = calendar.date(from: components)!
            let existing = acc[date] ?? []

            acc[date] = existing + [WeatherItem(date: timestampDate, main: cur.main, weather: cur.weather, clouds: cur.clouds, wind: cur.wind, visibility: cur.visibility)]
        }

        let result = groupedByDateComponents
            .map { key, value in DateWeatherItem(date: key, items: value) }
            .sorted(by: { $0.date < $1.date })
        return result
    }
}
