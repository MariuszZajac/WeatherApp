//
//  WeatherWeekViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation
//MARK: Weekly Weather forecast model
final class WeatherWeekViewModel: ObservableObject {

    @Published var weekWeatherItem: WeatherData.Daily
  
    init(weekWeatherItem: WeatherData.Daily) {
        self.weekWeatherItem = weekWeatherItem
    }
    
     
}
