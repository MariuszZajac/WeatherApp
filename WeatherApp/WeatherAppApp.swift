//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    @StateObject private var locationManager = LocationManager()
    
    private let apiService = WeatherAPIService()
    private let dataCache = WeatherDataCache(fileName: "weatherCache.json")

    
    
    var body: some Scene {
        WindowGroup {
            WeatherView(viewModel: WeatherViewModel(repository: WeatherRepository(weatherAPIService: apiService, weatherDataCache: dataCache)), cityViewModel: CityViewModel(locationManager: locationManager))
                .onAppear{
                    locationManager.requestLocation()
                }
        }
        
    }
}
    
