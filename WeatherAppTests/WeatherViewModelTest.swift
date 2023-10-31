//
//  WeatherViewModelTest.swift
//  WeatherAppTests
//
//  Created by Mariusz Zając on 18/10/2023.
//

import Foundation
import XCTest

@testable import WeatherApp

class WeatherViewModelTest: XCTestCase {
  func testInitialState() {
    //Arrange
    let mock = MockWeatherRepository()
    let geocoder = LocationGeocoder()
    let sut = WeatherViewModel(repository: mock, geocoder: geocoder)

    //act

    //assert

    XCTAssertEqual(sut.state, .loading)
  }

  func testSuccesState() async {
    //Arrange

    let mock = MockWeatherRepository()
    mock.weatherData = .make()
      let geocoder = LocationGeocoder()
    //  var cityData = try? await geocoder.reverseGeocodeUserLocation()
      
      let sut = WeatherViewModel(repository: mock, geocoder: geocoder)
    //act
    await sut.fetchData()
    //assert

    XCTAssertEqual(sut.state, .loaded)
    XCTAssertNotNil(sut.currentForecast)
    XCTAssertNotNil(sut.$selectedForecastType)
    XCTAssertNotNil(sut.error )
    XCTAssertTrue(sut.temp > 0)
  }
}
class MockWeatherRepository: WeatherRepositoryProtocol {
  var error: Error?
  var weatherData: WeatherData?

  func fetchWeatherData(latitude: Double, longitude: Double) async throws -> WeatherApp.WeatherData
  {
    if let error = error {
      throw error
    } else {
      return weatherData!
    }

  }

}

extension WeatherViewModel.State: Equatable {
  public static func == (lhs: WeatherViewModel.State, rhs: WeatherViewModel.State) -> Bool {
    switch (lhs, rhs) {
    case (.error(let lmessage), .error(let rmessage)):
      return lmessage == rmessage
    case (.loading, .loading):
      return true
    case (.loaded, .loaded):
      return true
    case (.loading, .error):
      return false
    case (.error, .loading):
      return false

    default: return true

    }
  }

}
class MockLocationGeocoder: LocationGeocoderProtocol {
  
    func reverseGeocodeUserLocation() async throws -> WeatherApp.City {
        
        let cityData = City.make()
        return cityData
    }
}
