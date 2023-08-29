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
    private let baseUrl = APIConfig.baseURL
    private let apiKey = APIConfig.apiKey
    private let units = "metric"
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func downloadWeatherData(latitude: Double, longitude: Double) async throws -> WeatherResponse {
        
        var urlComponents = URLComponents(string: baseUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitude)"),
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "units", value: units)
        ]
        
        guard let url = urlComponents?.url else {
            throw WeatherError.invalidURL
        }
        // Wykonaj zapytanie
        do {
            let (data, response) = try await urlSession.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                ErrorLogger.shared.logError(WeatherError.invalidHTTPResponse)
                throw WeatherError.invalidHTTPResponse
            }
            
            // Przetwórz dane
            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                return weatherResponse
            } catch {
                ErrorLogger.shared.logError(error)
                throw WeatherError.dataDecodingError
            }
        } catch {
            ErrorLogger.shared.logError(error)
            throw WeatherError.networkError
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
