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
    let coordinate: Coordinate
    
    init(city: String = "Paris", coordinate: Coordinate = Coordinate()) {
        self.city = city
        self.coordinate = coordinate
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
    
    init() {
        self.location = CLLocationCoordinate2D(latitude: 51.509865, longitude: -0.118092)
    }
    
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
