//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    private let apiService = WeatherAPIService()
    private let dataCache = WeatherDataCache(fileName: "weatherCache.json")
    
    var body: some Scene {
        WindowGroup {
            WeatherView(vm: WeatherViewModel(repository: WeatherRepository(weatherAPIService: apiService, weatherDataCache: dataCache)))
               
        }
    }
}
    
