//
//  LocationGeocoderTest.swift
//  WeatherAppTests
//
//  Created by Mariusz Zając on 06/11/2023.
//

import CoreLocation
import Foundation
import XCTest

@testable import WeatherApp

class LocationGeocoderTest: XCTestCase {
  func testReverseGeocodeUserLocation() async {
    // Arrange
    let mockManager = MockLocationManager()
    mockManager.mockLocation = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
    let geocoder = LocationGeocoder(locationManager: mockManager)

    // Act
    do {
      let city = try await geocoder.reverseGeocodeUserLocation()

      // Assert
      XCTAssertEqual(city.city, "San Francisco")
      XCTAssertEqual(city.country, "United States")
      XCTAssertEqual(city.latitude, 37.7749)
      XCTAssertEqual(city.longitude, -122.4194)
    } catch {
      XCTFail("Unexpected error: \(error)")
    }
  }
}
class MockLocationManager: LocationManager {
  var mockLocation: CLLocationCoordinate2D?
  var mockError: Error?

  override func startObservingLocationChanges() async throws -> CLLocationCoordinate2D {
    if let mockError = mockError {
      throw mockError
    }
    guard let mockLocation = mockLocation else {
      fatalError("Mock location not set for testing.")
    }
    return mockLocation
  }
}

