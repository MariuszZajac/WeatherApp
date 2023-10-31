//
//  CityBuilder.swift
//  WeatherAppTests
//
//  Created by Mariusz Zając on 31/10/2023.
//

import Foundation

@testable import WeatherApp

extension City {
  static func make(
    city: String = "Tokio",
    country: String = "Japan",
    latitude: Double = 35.689506,
    longitude: Double = 139.691700
  ) -> Self {
    return
      City(
        city: city,
        country: country,
        latitude: latitude,
        longitude: longitude) as! Self

  }
}
