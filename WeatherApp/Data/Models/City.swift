//
//  City.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 04/09/2023.
//

import Foundation
import CoreLocation

class City: Codable, Identifiable, ObservableObject{
    var id = UUID()
    var city: String
    var country: String
    var latitude: CLLocationDegrees
    var longitude: CLLocationDegrees
    
    init(city: String, country: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        self.city = city
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        
    }
    
}


