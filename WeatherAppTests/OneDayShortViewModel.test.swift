//
//  OneDayShortViewModel.test.swift
//  WeatherAppTests
//
//  Created by Mariusz Zając on 13/10/2023.
//

import XCTest
import Foundation
@testable import WeatherApp

class OneDayShortViewModelTest: XCTestCase {
    
    func testEmptyState() {
        let temp = Temperature.make()
        let weather = WeatherInfo.make()
        let sut = OneDayShortViewModel(forecast: DailyWeather.make(temp: temp, feelsLike: temp, weather: weather))
        XCTAssertEqual(sut.shortDayOfWeek, "THU")
    }
}
