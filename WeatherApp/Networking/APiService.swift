//
//  APIService.swift
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
    private let baseUrl = APIConfig.baseURL
    private let apiKey = APIConfig.apiKey
    private let units = "metric"
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    func downloadWeatherData(latitude: Double, longitude: Double) async throws -> WeatherResponse {
        guard let url = constructWeatherURL(latitude: latitude, longitude: longitude) else {
            throw WeatherError.invalidURL
        }
        do {
            let (data, response) = try await urlSession.data(from: url)
            guard isValidHTTPResponse(response) else {
                throw WeatherError.invalidHTTPResponse
            }
            return try decodeWeatherData(data)
        } catch {
            ErrorLogger.shared.logError(error)
            throw WeatherError.networkError
        }
    }
    private func constructWeatherURL(latitude: Double, longitude: Double) -> URL? {
        var urlComponents = URLComponents(string: baseUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitude)"),
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "units", value: units)
        ]
        return urlComponents?.url
    }
    private func isValidHTTPResponse(_ response: URLResponse?) -> Bool {
        guard let httpResponse = response as? HTTPURLResponse else {
            return false
        }
        return httpResponse.statusCode == 200
    }
    private func decodeWeatherData(_ data: Data) throws -> WeatherResponse {
        do {
            let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        } catch {
            ErrorLogger.shared.logError(error)
            throw WeatherError.dataDecodingError
        }
    }
}

enum WeatherError: Error, LocalizedError {
    case invalidURL
    case dataDecodingError
    case networkError
    case invalidHTTPResponse
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Nieprawidłowy URL."
        case .dataDecodingError:
            return "Błąd dekodowania danych."
        case .networkError:
            return "Błąd sieci."
        case .invalidHTTPResponse:
            return "Nieprawidłowa odpowiedź HTTP."
        }
    }
}
