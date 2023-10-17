//
//  City.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 04/09/2023.
//

import Foundation
import CoreLocation

struct City: Codable {
    let city: String
    let country: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    
    init(city: String, country: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.city = city
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        
    }
    
}


