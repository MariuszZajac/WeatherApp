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
      
//TODO: check error here
        
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

  }
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    locationContinuation?.resume(throwing: error)
    print("Błąd podczas pobierania lokalizacji", error)
  }
}
