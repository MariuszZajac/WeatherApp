//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import Foundation

final class WeatherViewModel: ObservableObject {
    @Published var error: WeatherError?


    @Published var weatherDataUI: [DateWeatherItem] = []

    var icon: String {
        weatherDataUI.first?.items.first?.weather.first?.icon ?? ""
    }

    var temp: Double {
        weatherDataUI.first?.items.first?.main.temp ?? 0
    }

    private let repository: WeatherRepositoryProtocol

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
