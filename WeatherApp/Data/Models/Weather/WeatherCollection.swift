//
//  WeatherCollection.swift
//  WeatherApp
//
//  Created by Piotr Torczynski on 21/09/2023.
//

import Foundation

struct DateWeatherItem {
    let date: Date // day + month
    let items: [WeatherItem]
}

struct WeatherItem {
    let date: Date
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
}
