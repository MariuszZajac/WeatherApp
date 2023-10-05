//
//  DayDetailViewModel.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation
//MARK: Hourly Weather forecast model
final class DayDetailViewModel: ObservableObject {

    private let detailWeather: HourlyWeather
    
    var temp: String {
        detailWeather.temp.roundDouble()
    }
//    var wind: Wind {
//        detailWeather.wind
//    }

    init(detailWeather: HourlyWeather) {
        self.detailWeather = detailWeather
    }

}

