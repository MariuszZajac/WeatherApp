//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import SwiftUI

@main
struct WeatherAppApp: App {
  private let dependencyContainer = DependencyContainer()

  var body: some Scene {
    WindowGroup {
      WeatherView(
        viewModel: WeatherViewModel(
          repository:
            WeatherRepository(
              weatherAPIService: dependencyContainer.apiService,
              weatherDataCache: dependencyContainer.dataCache),
          geocoder: LocationGeocoder()))

    }

  }
}
