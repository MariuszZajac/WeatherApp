//
//  APiService.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import Foundation

protocol WeatherAPIServiceProtocol {
    func downloadWeatherData(latitude: Double, longitude: Double) async throws -> WeatherResponse
}

final class WeatherAPIService: WeatherAPIServiceProtocol {
    private let urlSession: URLSession
    private let baseUrl = "https://api.openweathermap.org/data/2.5/forecast"
    private let apiKey = "2cf58968364dce8a18154518e855ae80"

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func downloadWeatherData(latitude: Double, longitude: Double) async throws -> WeatherResponse {
        let urlString = "\(baseUrl)?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else {
            throw WeatherError.invalidURL
        }
        // Wykonaj zapytanie
        let (data, _) = try await urlSession.data(from: url)
        
        // Przetwórz dane
        guard let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) else {
            throw WeatherError.dataDecodingError
        }
        
        return weatherResponse
    }


}

enum WeatherError: Error {
    case invalidURL
    case dataDecodingError
}

