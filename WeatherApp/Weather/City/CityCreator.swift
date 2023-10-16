//
//  CityCreator.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 04/09/2023.
//

import Foundation
import CoreLocation

struct City {
    var city: String
    var country: String
    let coordinate: Coordinate
    init(city: String, country: String, coordinate: Coordinate) {
        self.city = city
        self.coordinate = coordinate
        self.country = country
    }
}
struct Coordinate {
    var location: CLLocationCoordinate2D
    var latitude: CLLocationDegrees {
        return location.latitude
    }
    var longitude: CLLocationDegrees {
        return location.longitude
    }
    
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
