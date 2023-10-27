//
//  WeatherViewSnapshotTest.swift
//  WeatherAppTests
//
//  Created by Mariusz Zając on 27/10/2023.
//

import Foundation
import SnapshotTesting
import XCTest

@testable import WeatherApp

class WeatherViewSnapshotTest: XCTestCase {

  func testEmptyView() {
    //arrangeM
    let mock = MockWeatherRepository()
    mock.weatherData = .make()
    let geocoder = LocationGeoocoder()
    let viewModel = WeatherViewModel(repository: mock, geocoder: geocoder)
    let sut = WeatherView(viewModel: viewModel)
    //assert

    assertSnapshot(
      matching: sut,
      as: .image(layout: .device(config: .iPhone13)))

  }
  func testLoadedView() {
    //arrangeM
    let mock = MockWeatherRepository()
    mock.weatherData = .make()
    let geocoder = LocationGeoocoder()
    let viewModel = WeatherViewModel(repository: mock, geocoder: geocoder)
    viewModel.currentForecast = .make()
    viewModel.hourlyForecast = .make()
    viewModel.dayForecast = .make()
    let sut = WeatherView(viewModel: viewModel)
    //assert

    assertSnapshot(
      matching: sut,
      as: .image(layout: .device(config: .iPhone13)))

  }

}
