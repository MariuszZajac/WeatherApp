//
//  DayDetailViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation
//MARK: Hourly Weather forecast model
final class DayDetailViewModel: ObservableObject {

    private let detailWeatherItem: WeatherData.Hourly
    
    var temp: String {
        detailWeatherItem.temp.roundDouble()
    }
    var wind: Wind {
        detailWeatherItem.wind
    }

    init(detailWeatherItem: WeatherData.Hourly) {
        self.detailWeatherItem = detailWeatherItem
    }

}

