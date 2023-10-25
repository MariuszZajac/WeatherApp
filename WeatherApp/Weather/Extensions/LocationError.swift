//
//  LocationError.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 24/10/2023.
//

import Foundation

enum LocationError: Error {
    case locationServicesNotEnabled
    case locationDataNotAvailable
    case geocodingError(Error)
}
