//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import SwiftUI

struct WeatherView: View {
    // Dependency Injection
    @StateObject var weatherViewModel = WeatherViewModel(weatherAPIService: WeatherAPIService())

    var body: some View {
        List(weatherViewModel.weatherData.value) { weather in
            // Twoja customowa komórka dla wyświetlania danych pogodowych
        }
        .onAppear {
            weatherViewModel.fetchWeatherData(latitude: 51.816282, longitude: 23.011893)
        }
    }
}
