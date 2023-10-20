//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 17/10/2023.
//
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var city: City?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.stopUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
      
        print(location ?? "No locations")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Błąd podczas pobierania lokalizacji", error)
    }
    
    func reverseGeocodeUserLocation(completion: @escaping (Result<City, LocationError>) -> Void) {
        guard let userLocation = location else {
            completion(.failure(.locationDataNotAvailable))
            return
        }
        
        let location = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
        
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                completion(.failure(.geocodingError(error)))
            } else if let placemark = placemarks?.first, let city = placemark.locality, let country = placemark.country {
                let cityData = City(city: city, country: country, latitude: userLocation.latitude, longitude: userLocation.longitude)
                self.city = cityData
//                let locationData = WeatherDataCache(fileName: "location.json")
//                 locationData.saveLocationData(cityData)
                completion(.success(cityData))
            } else {
                completion(.failure(.locationDataNotAvailable))
            }
        }
    }
    
    
    
    
    enum LocationError: Error {
        case locationServicesNotEnabled
        case locationDataNotAvailable
        case geocodingError(Error)
    }
}
