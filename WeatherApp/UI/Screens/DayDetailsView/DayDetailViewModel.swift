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
    
    var weatherIcon: WeatherIcon {
        detailWeather.weather.first?.icon ?? .snowNight
    }
    var weatherDescription: String {
        detailWeather.weather.first?.description ?? ""
    }

    var dt: String {
        getDayOfWeek(from: detailWeather.dt) ?? "SET"
    }
    
    var devpoint: String {
        detailWeather.dewPoint.roundDouble()
    }
    var pressure: String {
        String(detailWeather.pressure) }
    var humidity: String {
        String(detailWeather.humidity )}
   
    var uvi: String {
        String( detailWeather.uvi )}
    var clouds: Int {
        detailWeather.clouds}
    var visibility: Int{
        detailWeather.visibility }
    var wind: Wind {
        let speed = detailWeather.windSpeed
        let deg = detailWeather.windDeg
        let gust = detailWeather.windGust
        return Wind(windSpeed: speed, windDeg: deg, windGust: gust)
    
    }
    init(detailWeather: HourlyWeather) {
        self.detailWeather = detailWeather
    }

}

