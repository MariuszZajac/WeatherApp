//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import Foundation
import SwiftUI

final class WeatherViewModel: ObservableObject {
    enum ForecastType: Int {
        case hour = 0
        case week
    }
    enum State {
        case loading, error(String), loaded
    }
    
    @Published var state: State = .loaded
    @Published var dayForecast: [DailyWeather] = []
    @Published var hourlyForecast: [HourlyWeather] = []
    @Published var currentForecast: CurrentWeather?
    @Published var selectedForecastType: ForecastType = .hour
    @Published var city: City?
    
    private let repository: WeatherRepositoryProtocol
    private var forecast: WeatherData?
    private let geocoder: LocationGeoocoder
    
    init( repository: WeatherRepositoryProtocol, geocoder: LocationGeoocoder ){
        self.repository = repository
        self.geocoder = geocoder
    }
    var error: WeatherError?
    
    var icon: WeatherIcon {
        currentForecast?.weather.first?.icon ?? .snowNight
    }
    var temp: Double {
        (currentForecast?.temp ?? 0.0)
    }
    var description: String {
        currentForecast?.weather.first?.description ?? ""
    }
    
    var wind: Wind {
        let speed = currentForecast?.windSpeed ?? 0
        let deg = currentForecast?.windDeg ?? 0
        let gust = 0.0
        return Wind(windSpeed: speed, windDeg: deg, windGust: gust)
        
    }
    var rain: Double {
        currentForecast?.rain?.oneHour ?? 0.0
    }
    
    func refreshData() {
        Task{ await fetchData()}
    }

    @MainActor
    func fetchData() async {
        state = .loading
        do {
            let city = try await geocoder.reverseGeocodeUserLocation()
            self.city = city
            let data = try await repository.fetchWeatherData(latitude: city.latitude, longitude: city.longitude)
            dayForecast = data.daily
            hourlyForecast = data.hourly
            currentForecast = data.current
            state = .loaded
        } catch {
            if let weatherError = error as? WeatherError {
                self.error = weatherError
                state = .error(error.localizedDescription)
               
            }
        }
    }
 }

