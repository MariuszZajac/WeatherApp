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
  

    
    func fetchCityAndCountry() {
        let locationManager = LocationManager()
        locationManager.getCityAndCountry { result in
            switch result {
            case .success(let cityData):
                
                self.city = cityData
            case .failure:
                break
                
            }
        }
    }
}

