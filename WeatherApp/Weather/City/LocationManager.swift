//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 16/10/2023.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    
    @Published var location: CLLocationCoordinate2D?
    var locationReceived: ((CLLocationCoordinate2D?) -> Void)?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        locationReceived?(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Błąd podczas pobierania lokalizacji", error)
    }
    func reverseGeocodeLocation(completion: @escaping (String?, String?) -> Void) {
           if let location = location {
               let locationToGeocode = CLLocation(latitude: location.latitude, longitude: location.longitude)
               geocoder.reverseGeocodeLocation(locationToGeocode) { placemarks, error in
                   if let error = error {
                       print("Błąd podczas geokodowania lokalizacji: \(error)")
                       completion(nil, nil)
                   } else if let placemark = placemarks?.first {
                       var cityName = "Brak info"
                       if let locality = placemark.locality {
                           cityName = locality
                       }
                       
                       var countryName = "Brak info"
                       if let country = placemark.country {
                           countryName = country
                       }

                       completion(cityName, countryName)
                   } else {
                       completion("Brak info", "Brak info")
                   }
               }
           }
       }
}
