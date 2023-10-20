//
//  CityViewModel.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import SwiftUI
import CoreLocation
import Combine

class CityViewModel: ObservableObject {
    @Published var city: City
    
    private var locationManager: LocationManager
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        self.city =  City(city: "", country: "", latitude: 0.0, longitude: 0.0)
    }
    

    var cityName: String {
        city.city
    }
    var countryName: String {
        city.country
    }
    var latitude: Double {
        city.latitude
    }
    var longnitude: Double {
        city.longitude
    }
    
    func fetchCityAndCountry() {
        locationManager.reverseGeocodeUserLocation { result in
            switch result {
            case .success(let cityData):
                DispatchQueue.main.async {
                    self.city = cityData
                 
                }
            case .failure(let error):
                let locationData = WeatherDataCache(fileName: "location.json")
                if let location = locationData.fetchLocationData() {
                       self.city = location
                } else {
                    print(error)
                }
            }
        }
    }
}

