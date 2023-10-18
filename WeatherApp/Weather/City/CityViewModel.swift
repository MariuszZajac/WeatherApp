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
    @Published var city: City?
    
    private var locationManager: LocationManager
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
    }
    var cityName: String {
        city?.city ?? "N/A"
    }
    var countryName: String {
        city?.country ?? "N/A"
    }
//    var latitude: Double {
//        city?.latitude ?? 0.0
//    }
//    var longitude: Double {
//        city?.longitude ?? 0.0
//    }
//    
    func fetchCityAndCountry() {
        locationManager.reverseGeocodeUserLocation { result in
            switch result {
            case .success(let cityData):
                DispatchQueue.main.async {
                    self.city = cityData
                 
                }
            case .failure(let error):
                print("Błąd podczas pobierania danych lokalizacji: \(error)")
            }
        }
    }
}

