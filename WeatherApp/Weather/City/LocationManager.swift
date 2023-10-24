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
    private var locationContinuation: CheckedContinuation<CLLocationCoordinate2D, Error>?
        
        func startObservingLocationChanges() async throws -> CLLocationCoordinate2D {
            return try await withCheckedThrowingContinuation { continuation in
                locationContinuation = continuation
                locationManager.startUpdatingLocation()
            }
        }
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }
    
   
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.first?.coordinate else {
            return
        }
        locationManager.stopUpdatingLocation()
        locationContinuation?.resume(returning: currentLocation)
       
        // debug
        print(currentLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationContinuation?.resume(throwing: error)
        print("Błąd podczas pobierania lokalizacji", error)
    }
}

enum LocationError: Error {
    case locationServicesNotEnabled
    case locationDataNotAvailable
    case geocodingError(Error)
}

class LocationGeoocoder {
    private var location: CLLocationCoordinate2D?
    private let locationManager: LocationManager
    private let geocoder = CLGeocoder()
    init (locationManager: LocationManager = LocationManager()) {
        self.locationManager = locationManager
    }
    
    func reverseGeocodeUserLocation() async throws -> City {
        let userLocation = try await locationManager.startObservingLocationChanges()
       
        let location = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
        let placemarks = try await geocoder.reverseGeocodeLocation(location)
        
        guard let placemark = placemarks.first, let city = placemark.locality, let country = placemark.country else { throw LocationError.locationServicesNotEnabled }
        let cityData = City(city: city, country: country, latitude: userLocation.latitude, longitude: userLocation.longitude)
        return cityData
        
    }
}

